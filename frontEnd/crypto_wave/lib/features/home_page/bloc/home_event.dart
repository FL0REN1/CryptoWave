part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

// Предполагает загрузку данных авторизации. Это событие содержит список пользователей, которые будут загружены из userRepository.
class LoadHome extends HomeEvent {
  final Completer? completer;

  const LoadHome({required this.completer});

  @override
  List<Object> get props => [];
}