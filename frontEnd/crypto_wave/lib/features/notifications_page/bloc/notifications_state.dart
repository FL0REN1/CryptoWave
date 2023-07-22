part of 'notifications_bloc.dart';

class NotificationsState extends Equatable {
  const NotificationsState();

  @override
  List<Object?> get props => [];
}

class NotificationsLoading extends NotificationsState {
  const NotificationsLoading();

  @override
  List<Object?> get props => [];
}

class NotificationsLoaded extends NotificationsState {
  final List<NotificationsRead> notifications;

  const NotificationsLoaded({required this.notifications});

  @override
  List<Object?> get props => [notifications];
}

class NotificationsLoadingFailure extends NotificationsState {
  final Object exception;

  const NotificationsLoadingFailure(this.exception);

  @override
  List<Object?> get props => super.props..add(exception);
}
