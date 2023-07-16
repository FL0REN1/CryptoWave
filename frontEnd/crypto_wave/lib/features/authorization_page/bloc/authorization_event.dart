part of 'authorization_bloc.dart';

abstract class AutorizationEvent extends Equatable {
  const AutorizationEvent();

  @override
  List<Object> get props => [];
}

// Предполагает загрузку данных авторизации. Это событие содержит список пользователей, которые будут загружены из userRepository.
class LoadAutorization extends AutorizationEvent {
  const LoadAutorization();

  @override
  List<Object> get props => [];
}
