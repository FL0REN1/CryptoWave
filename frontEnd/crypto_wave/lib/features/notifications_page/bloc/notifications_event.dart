part of 'notifications_bloc.dart';

abstract class NotificationsEvent extends Equatable {
  const NotificationsEvent();

  @override
  List<Object?> get props => [];
}

class LoadNotifications extends NotificationsEvent {
  final Completer? completer;
  final int userId;

  const LoadNotifications({required this.completer, required this.userId});

  @override
  List<Object> get props => [userId];
}

class DeleteNotificationById extends NotificationsEvent {
  final int id;
  final Completer? completer;

  const DeleteNotificationById({required this.id, required this.completer});

  @override
  List<Object> get props => [id];
}

class DeleteNotificationsAll extends NotificationsEvent {
  final int userId;
  final Completer? completer;

  const DeleteNotificationsAll({required this.userId, required this.completer});

  @override
  List<Object> get props => [userId];
}

class DeleteNotificationsChoosen extends NotificationsEvent {
  final int userId;
  final Completer? completer;

  const DeleteNotificationsChoosen(
      {required this.userId, required this.completer});

  @override
  List<Object> get props => [userId];
}

class ChangeNotificationToChoosen extends NotificationsEvent {
  final int id;
  final Completer? completer;
  final int userId;

  const ChangeNotificationToChoosen(
      {required this.id, required this.completer, required this.userId});

  @override
  List<Object> get props => [id, userId];
}

class ChangeNotificationsAllToChoosen extends NotificationsEvent {
  final int userId;
  final Completer? completer;

  const ChangeNotificationsAllToChoosen(
      {required this.userId, required this.completer});

  @override
  List<Object> get props => [userId];
}

class ChangeNotificationsAllToRead extends NotificationsEvent {
  final int userId;
  final Completer? completer;

  const ChangeNotificationsAllToRead(
      {required this.userId, required this.completer});

  @override
  List<Object> get props => [userId];
}
