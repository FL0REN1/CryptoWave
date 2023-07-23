import 'dart:async';

import 'package:crypto_wave/repositories/coins_repository/coins_repository.dart';
import 'package:crypto_wave/repositories/coins_repository/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc(this.searchRepository) : super(const SearchState()) {
    on<LoadSearch>(_load);
  }

  final AbstractCoinsRepository searchRepository;

  Future<void> _load(
    LoadSearch event,
    Emitter<SearchState> emit,
  ) async {
    try {
      if (state is! SearchLoaded) {
        emit(const SearchLoading());
      }

      final searchList = await searchRepository.getCoinsList();

      emit(SearchLoaded(search: searchList));
    } catch (e, st) {
      emit(SearchLoadingFailure(e));
      GetIt.I<Talker>().handle(e, st);
    } finally {
      event.completer?.complete();
    }
  }
}
