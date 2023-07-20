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
