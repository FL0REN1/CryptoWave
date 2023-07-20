import 'dart:async';

import 'package:crypto_wave/repositories/coins_repository/coins_repository.dart';
import 'package:crypto_wave/repositories/coins_repository/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(this.coinsRepository) : super(const HomeState()) {
    on<LoadHome>(_load);
  }

  final AbstractCoinsRepository coinsRepository;
  Timer? _timer;

  Future<void> _load(
    LoadHome event,
    Emitter<HomeState> emit,
  ) async {
    try {
      if (state is! HomeLoaded) {
        emit(const HomeLoading());
      }

      final coinsList = await coinsRepository.getCoinsList();

      emit(HomeLoaded(coins: coinsList));
    } catch (e, st) {
      emit(HomeLoadingFailure(e));
      GetIt.I<Talker>().handle(e, st);
    } finally {
      event.completer?.complete();
    }
  }

  void startUpdatingCoins() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 10), (_) {
      add(const LoadHome(completer: null));
    });
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
