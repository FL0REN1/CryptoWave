import 'dart:async';

import 'package:crypto_wave/repositories/news_repository/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crypto_wave/repositories/news_repository/news_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc(this.newsRepository) : super(const NewsState()) {
    on<LoadNews>(_load);
  }

  final AbstractNewsRepository newsRepository;

  Future<void> _load(
    LoadNews event,
    Emitter<NewsState> emit,
  ) async {
    try {
      if (state is! NewsLoaded) {
        emit(const NewsLoading());
      }

      final newsList = await newsRepository.getAllNews();

      emit(NewsLoaded(news: newsList));
    } catch (e, st) {
      emit(NewsLoadingFailure(e));
      GetIt.I<Talker>().handle(e, st);
    } finally {
      event.completer?.complete();
    }
  }
}
