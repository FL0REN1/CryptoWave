part of 'authorization_bloc.dart';

class AutorizationState extends Equatable {
  const AutorizationState();

  @override
  List<Object?> get props => [];
}

class AutorizationLoading extends AutorizationState {
  const AutorizationLoading();
}

class AutorizationLoaded extends AutorizationState {
  const AutorizationLoaded();

  @override
  List<Object?> get props => [];
}

class AutorizationLoadingFailure extends AutorizationState {
  const AutorizationLoadingFailure(this.exception);

  final Object exception;

  @override
  List<Object?> get props => super.props..add(exception);
}
