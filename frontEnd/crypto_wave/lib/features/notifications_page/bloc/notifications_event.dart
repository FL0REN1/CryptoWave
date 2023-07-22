part of 'notifications_bloc.dart';

abstract class NotificationsEvent extends Equatable {
  const NotificationsEvent();

  @override
  List<Object?> get props => [];
}

class LoadNotifications extends NotificationsEvent {
  final Completer? completer;

  const LoadNotifications({required this.completer});

  @override
  List<Object> get props => [];
}

class DeleteNotifications extends NotificationsEvent {
  final int id;
  final Completer? completer;

  const DeleteNotifications({required this.id, required this.completer});

  @override
  List<Object> get props => [id];
}

class ChangeNotifications extends NotificationsEvent {
  final int id;
  final Completer? completer;

  const ChangeNotifications({required this.id, required this.completer});

  @override
  List<Object> get props => [id];
}
