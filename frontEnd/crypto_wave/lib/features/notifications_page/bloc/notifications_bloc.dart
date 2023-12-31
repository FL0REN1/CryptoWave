import 'dart:async';

import 'package:crypto_wave/repositories/notifications_repository/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crypto_wave/repositories/notifications_repository/notifications_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'notifications_event.dart';
part 'notifications_state.dart';

class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  NotificationsBloc(this.notificationsRepository)
      : super(const NotificationsState()) {
    on<LoadNotifications>(_load);
    on<DeleteNotificationById>(_deleteById);
    on<DeleteNotificationsAll>(_deleteAll);
    on<DeleteNotificationsChoosen>(_deleteChoosen);
    on<ChangeNotificationsAllToChoosen>(_changeAllToChosen);
    on<ChangeNotificationToChoosen>(_changeToChoosen);
    on<ChangeNotificationsAllToRead>(_changeAllToRead);
  }

  final AbstractNotificationsRepository notificationsRepository;

  Future<void> _load(
    LoadNotifications event,
    Emitter<NotificationsState> emit,
  ) async {
    try {
      if (state is! NotificationsLoaded) {
        emit(const NotificationsLoading());
      }

      final notificationsList =
          await notificationsRepository.getAllNotifications(event.userId);

      emit(NotificationsLoaded(notifications: notificationsList));
    } catch (e, st) {
      emit(NotificationsLoadingFailure(e));
      GetIt.I<Talker>().handle(e, st);
    } finally {
      event.completer?.complete();
    }
  }

  Future<void> _changeToChoosen(
    ChangeNotificationToChoosen event,
    Emitter<NotificationsState> emit,
  ) async {
    try {
      emit(const NotificationsLoading());

      NotificationsChangeToChoosen notificationsChangeToChoosen =
          NotificationsChangeToChoosen(id: event.id);

      await notificationsRepository
          .changeToChoosenNotification(notificationsChangeToChoosen);

      final notificationsList =
          await notificationsRepository.getAllNotifications(event.userId);

      emit(NotificationsLoaded(notifications: notificationsList));
    } catch (e, st) {
      emit(NotificationsLoadingFailure(e));
      GetIt.I<Talker>().handle(e, st);
    } finally {
      event.completer?.complete();
    }
  }

  Future<void> _changeAllToChosen(
    ChangeNotificationsAllToChoosen event,
    Emitter<NotificationsState> emit,
  ) async {
    try {
      emit(const NotificationsLoading());

      NotificationsChangeAllToChoosen notificationsChangeAllToChoosen =
          NotificationsChangeAllToChoosen(userId: event.userId);

      await notificationsRepository
          .changeAllToChoosenNotifications(notificationsChangeAllToChoosen);

      final notificationsList =
          await notificationsRepository.getAllNotifications(event.userId);

      emit(NotificationsLoaded(notifications: notificationsList));
    } catch (e, st) {
      emit(NotificationsLoadingFailure(e));
      GetIt.I<Talker>().handle(e, st);
    } finally {
      event.completer?.complete();
    }
  }

  Future<void> _changeAllToRead(
    ChangeNotificationsAllToRead event,
    Emitter<NotificationsState> emit,
  ) async {
    try {
      emit(const NotificationsLoading());

      NotificationsChangeAllToRead notificationsChangeAllToRead =
          NotificationsChangeAllToRead(userId: event.userId);

      await notificationsRepository
          .changeAllNotificationsToRead(notificationsChangeAllToRead);

      final notificationsList =
          await notificationsRepository.getAllNotifications(event.userId);

      emit(NotificationsLoaded(notifications: notificationsList));
    } catch (e, st) {
      emit(NotificationsLoadingFailure(e));
      GetIt.I<Talker>().handle(e, st);
    } finally {
      event.completer?.complete();
    }
  }

  Future<void> _deleteById(
    DeleteNotificationById event,
    Emitter<NotificationsState> emit,
  ) async {
    try {
      final updatedNotifications = (state as NotificationsLoaded)
          .notifications
          .where((notification) => notification.id != event.id)
          .toList();

      emit(NotificationsLoaded(notifications: updatedNotifications));

      await notificationsRepository.deleteNotifications(
        NotificationsDelete(id: event.id),
      );
    } catch (e, st) {
      emit(NotificationsLoadingFailure(e));
      GetIt.I<Talker>().handle(e, st);
    } finally {
      event.completer?.complete();
    }
  }

  Future<void> _deleteAll(
    DeleteNotificationsAll event,
    Emitter<NotificationsState> emit,
  ) async {
    try {
      emit(const NotificationsLoading());

      NotificationsDeleteAll deleteNotificationsAll =
          NotificationsDeleteAll(userId: event.userId);

      await notificationsRepository
          .deleteAllNotifications(deleteNotificationsAll);

      final notificationsList =
          await notificationsRepository.getAllNotifications(event.userId);

      emit(NotificationsLoaded(notifications: notificationsList));
    } catch (e, st) {
      emit(NotificationsLoadingFailure(e));
      GetIt.I<Talker>().handle(e, st);
    } finally {
      event.completer?.complete();
    }
  }

  Future<void> _deleteChoosen(
    DeleteNotificationsChoosen event,
    Emitter<NotificationsState> emit,
  ) async {
    try {
      emit(const NotificationsLoading());

      NotificationsDeleteChoosen deleteNotificationsAll =
          NotificationsDeleteChoosen(id: event.userId);

      await notificationsRepository
          .deleteChoosenNotifications(deleteNotificationsAll);

      final notificationsList =
          await notificationsRepository.getAllNotifications(event.userId);

      emit(NotificationsLoaded(notifications: notificationsList));
    } catch (e, st) {
      emit(NotificationsLoadingFailure(e));
      GetIt.I<Talker>().handle(e, st);
    } finally {
      event.completer?.complete();
    }
  }
}
