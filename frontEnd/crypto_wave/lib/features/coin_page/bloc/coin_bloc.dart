import 'dart:async';

import 'package:crypto_wave/repositories/coins_repository/coins_repository.dart';
import 'package:crypto_wave/repositories/coins_repository/models/models.dart';
import 'package:crypto_wave/repositories/wallet_repository/models/models.dart';
import 'package:crypto_wave/repositories/wallet_repository/wallet_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'coin_event.dart';
part 'coin_state.dart';

class CoinBloc extends Bloc<CoinEvent, CoinState> {
  CoinBloc(this.coinsRepository, this.walletRepository)
      : super(const CoinState()) {
    on<LoadCoin>(_load);
    on<LoadFavoriteChangeCoin>(_loadFavoriteChange);
  }

  final AbstractCoinsRepository coinsRepository;
  final AbstractWalletRepository walletRepository;

  Timer? _timer;

  Future<void> _load(
    LoadCoin event,
    Emitter<CoinState> emit,
  ) async {
    try {
      if (state is! CoinLoaded) {
        emit(const CoinLoading());
      }

      WalletGetDetails walletGetDetails = WalletGetDetails(
          userId: event.userId, currencyName: event.currencyName);

      final wallet = await walletRepository.getDetailsWallet(walletGetDetails);
      final coin = await coinsRepository.getCoinDetails(event.currencyCode);

      emit(CoinLoaded(coin: coin, wallet: wallet));
    } catch (e, st) {
      emit(CoinLoadingFailure(e));
      GetIt.I<Talker>().handle(e, st);
    } finally {
      event.completer?.complete();
    }
  }

  Future<void> _loadFavoriteChange(
    LoadFavoriteChangeCoin event,
    Emitter<CoinState> emit,
  ) async {
    try {
      if (state is! CoinLoaded) {
        emit(const CoinLoading());
      }

      WalletChangeFavorite walletChangeFavorite = WalletChangeFavorite(
        userId: event.userId,
        currencyName: event.currencyName,
      );

      await walletRepository.changeFavoriteWallet(walletChangeFavorite);

      WalletGetDetails walletGetDetails = WalletGetDetails(
          userId: event.userId, currencyName: event.currencyName);

      final wallet = await walletRepository.getDetailsWallet(walletGetDetails);
      final coin = await coinsRepository.getCoinDetails(event.currencyCode);

      emit(CoinLoaded(coin: coin, wallet: wallet));
    } catch (e, st) {
      emit(CoinLoadingFailure(e));
      GetIt.I<Talker>().handle(e, st);
    } finally {
      event.completer?.complete();
    }
  }

  void startUpdatingCoins(
      String currencyCode, int userId, String currencyName) {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 10), (_) {
      add(LoadCoin(
        completer: null,
        currencyCode: currencyCode,
        userId: userId,
        currencyName: currencyName,
      ));
    });
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
