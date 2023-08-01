import 'dart:async';

import 'package:crypto_wave/repositories/coins_repository/coins_repository.dart';
import 'package:crypto_wave/repositories/coins_repository/models/models.dart';
import 'package:crypto_wave/repositories/wallet_repository/models/models.dart';
import 'package:crypto_wave/repositories/wallet_repository/wallet_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(this.coinsRepository, this.walletRepository)
      : super(const HomeState()) {
    on<LoadHome>(_load);
  }

  final AbstractCoinsRepository coinsRepository;
  final AbstractWalletRepository walletRepository;
  Timer? _timer;

  Future<void> _load(
    LoadHome event,
    Emitter<HomeState> emit,
  ) async {
    try {
      if (state is! HomeLoaded) {
        emit(const HomeLoading());
      }
      WalletGetAll walletGetDetails = WalletGetAll(
        userId: event.userId,
      );

      final wallet = await walletRepository.getAllWallet(walletGetDetails);
      final coinsList = await coinsRepository.getCoinsList();

      emit(HomeLoaded(coins: coinsList, wallets: wallet));
    } catch (e, st) {
      emit(HomeLoadingFailure(e));
      GetIt.I<Talker>().handle(e, st);
    } finally {
      event.completer?.complete();
    }
  }

  void startUpdatingCoins(int userId) {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 10), (_) {
      add(LoadHome(
          completer: null, userId: userId));
    });
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
