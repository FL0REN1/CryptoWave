part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

class LoadHome extends HomeEvent {
  final Completer? completer;

  const LoadHome({required this.completer});

  @override
  List<Object> get props => [];
}
