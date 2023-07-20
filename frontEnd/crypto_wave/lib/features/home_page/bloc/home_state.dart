part of 'home_bloc.dart';

class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

// Загрузка
class HomeLoading extends HomeState {
  const HomeLoading();

  @override
  List<Object?> get props => [];
}

// Успешная загрузка
class HomeLoaded extends HomeState {
  final List<Coins> coins;

  const HomeLoaded({required this.coins});

  @override
  List<Object?> get props => [coins];
}

// Загрузка с ошибкой
class HomeLoadingFailure extends HomeState {
  final Object exception;

  const HomeLoadingFailure(this.exception);

  @override
  List<Object?> get props => super.props..add(exception);
}
