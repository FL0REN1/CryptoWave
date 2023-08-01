part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

class LoadHome extends HomeEvent {
  final Completer? completer;
  final int userId;

  const LoadHome({
    required this.completer,
    required this.userId,
  });

  @override
  List<Object> get props => [userId];
}
