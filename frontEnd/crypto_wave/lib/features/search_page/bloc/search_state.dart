part of 'search_bloc.dart';

class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object?> get props => [];
}

class SearchLoading extends SearchState {
  const SearchLoading();

  @override
  List<Object?> get props => [];
}

class SearchLoaded extends SearchState {
  final List<Coins> search;

  const SearchLoaded({required this.search});

  @override
  List<Object?> get props => [search];
}

class SearchLoadingFailure extends SearchState {
  final Object exception;

  const SearchLoadingFailure(this.exception);

  @override
  List<Object?> get props => super.props..add(exception);
}
