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
    on<LoadDataEvent>(_loadData);
  }

  final AbstractCoinsRepository coinsRepository;
  final AbstractWalletRepository walletRepository;

  Timer? _timer;

  Future<void> _loadData(LoadDataEvent event, Emitter<CoinState> emit) async {
    try {
      if (state is! CoinLoaded) {
        emit(const CoinLoading());
      }

      switch (event.dataType) {
        case LoadDataType.coinDetails:
          await _loadCoinDetails(event, emit);
          break;
        case LoadDataType.change:
          await _loadChange(event, emit);
          break;
        case LoadDataType.allCoins:
          await _loadAllCoins(event, emit);
          break;
        case LoadDataType.buyCoin:
          await _buyCoin(event, emit);
          break;
        case LoadDataType.sellCoin:
          await _sellCoin(event, emit);
          break;
      }
    } catch (e, st) {
      emit(CoinLoadingFailure(e));
      GetIt.I<Talker>().handle(e, st);
    } finally {
      event.completer?.complete();
    }
  }

  Future<void> _loadCoinDetails(
    LoadDataEvent event,
    Emitter<CoinState> emit,
  ) async {
    WalletGetDetails walletGetDetails = WalletGetDetails(
      userId: event.userId,
      currencyName: event.currencyName,
    );

    final wallet = await walletRepository.getDetailsWallet(walletGetDetails);
    final coin = await coinsRepository.getCoinDetails(event.currencyCode);

    emit(CoinLoaded(coin: coin, wallet: wallet));
  }

  Future<void> _loadChange(
    LoadDataEvent event,
    Emitter<CoinState> emit,
  ) async {
    WalletChangeFavorite walletChangeFavorite = WalletChangeFavorite(
      userId: event.userId,
      currencyName: event.currencyName,
    );
    WalletGetDetails walletGetDetails = WalletGetDetails(
      userId: event.userId,
      currencyName: event.currencyName,
    );

    await walletRepository.changeFavoriteWallet(walletChangeFavorite);

    final wallet = await walletRepository.getDetailsWallet(walletGetDetails);
    final coin = await coinsRepository.getCoinDetails(event.currencyCode);

    emit(CoinLoaded(coin: coin, wallet: wallet));
  }

  Future<void> _loadAllCoins(
    LoadDataEvent event,
    Emitter<CoinState> emit,
  ) async {
    WalletGetDetails walletGetDetails = WalletGetDetails(
      userId: event.userId,
      currencyName: event.currencyName,
    );

    final coins = await coinsRepository.getCoinsList();
    final wallet = await walletRepository.getDetailsWallet(walletGetDetails);
    final coin = await coinsRepository.getCoinDetails(event.currencyCode);

    emit(CoinLoaded(coin: coin, wallet: wallet, listCoins: coins));
  }

  Future<void> _buyCoin(
    LoadDataEvent event,
    Emitter<CoinState> emit,
  ) async {
    WalletBuy walletBuy = WalletBuy(
      currencyCount: event.currencyCount,
      currencyToBuy: event.currencyToBuy,
      currencyToSell: event.currencyToSell,
      userId: event.userId,
      currencyToBuyPriceInUsd: event.currencyToBuyPriceInUsd,
      currencyToSellPriceInUsd: event.currencyToSellPriceInUsd,
    );
    WalletGetDetails walletGetDetails = WalletGetDetails(
      userId: event.userId,
      currencyName: event.currencyName,
    );

    final wallet = await walletRepository.getDetailsWallet(walletGetDetails);
    final coin = await coinsRepository.getCoinDetails(event.currencyCode);
    await walletRepository.buyWallet(walletBuy);

    emit(CoinLoaded(coin: coin, wallet: wallet));
  }

  Future<void> _sellCoin(
    LoadDataEvent event,
    Emitter<CoinState> emit,
  ) async {
    WalletSell walletSell = WalletSell(
      currencyCount: event.currencyCount,
      currencyToBuy: event.currencyToBuy,
      currencyToSell: event.currencyToSell,
      userId: event.userId,
      currencyToBuyPriceInUsd: event.currencyToBuyPriceInUsd,
      currencyToSellPriceInUsd: event.currencyToSellPriceInUsd,
    );
    WalletGetDetails walletGetDetails = WalletGetDetails(
      userId: event.userId,
      currencyName: event.currencyName,
    );

    final wallet = await walletRepository.getDetailsWallet(walletGetDetails);
    final coin = await coinsRepository.getCoinDetails(event.currencyCode);
    await walletRepository.sellWallet(walletSell);

    emit(CoinLoaded(coin: coin, wallet: wallet));
  }

  void startUpdatingCoins(
    String currencyCode,
    int userId,
    String currencyName,
    double currencyCount,
    String currencyToBuy,
    String currencyToSell,
    double currencyToBuyPriceInUsd,
    double currencyToSellPriceInUsd,
  ) {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 10), (_) {
      add(LoadDataEvent(
        completer: null,
        currencyCode: currencyCode,
        userId: userId,
        currencyName: currencyName,
        dataType: LoadDataType.coinDetails,
        currencyCount: currencyCount,
        currencyToBuy: currencyToBuy,
        currencyToSell: currencyToSell,
        currencyToBuyPriceInUsd: currencyToBuyPriceInUsd,
        currencyToSellPriceInUsd: currencyToSellPriceInUsd,
      ));
    });
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
