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
          await notificationsRepository.getAllNotifications();

      emit(NotificationsLoaded(notifications: notificationsList));
    } catch (e, st) {
      emit(NotificationsLoadingFailure(e));
      GetIt.I<Talker>().handle(e, st);
    } finally {
      event.completer?.complete();
    }
  }
}
