part of 'authorization_bloc.dart';

abstract class AutorizationEvent extends Equatable {
  const AutorizationEvent();

  @override
  List<Object> get props => [];
}

class LoadAutorization extends AutorizationEvent {
  const LoadAutorization();

  @override
  List<Object> get props => [];
}
