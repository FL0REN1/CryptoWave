part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object?> get props => [];
}

class LoadSearch extends SearchEvent {
  final Completer? completer;

  const LoadSearch({required this.completer});

  @override
  List<Object> get props => [];
}
