part of 'coin_bloc.dart';

abstract class CoinEvent extends Equatable {
  const CoinEvent();

  @override
  List<Object?> get props => [];
}

class LoadDataEvent extends CoinEvent {
  final Completer? completer;
  final String currencyCode;
  final int userId;
  final String currencyName;
  final String currencyNameSecondWallet;

  final double currencyCount;
  final double currencyToBuyPriceInUsd;
  final double currencyToSellPriceInUsd;
  final String currencyToBuy;
  final String currencyToSell;

  final LoadDataType dataType;

  const LoadDataEvent({
    required this.completer,
    required this.currencyCode,
    required this.userId,
    required this.currencyName,
    required this.dataType,
    required this.currencyCount,
    required this.currencyToBuy,
    required this.currencyToSell,
    required this.currencyToBuyPriceInUsd,
    required this.currencyToSellPriceInUsd,
    required this.currencyNameSecondWallet,
  });

  @override
  List<Object> get props => [
        currencyCode,
        userId,
        currencyName,
        dataType,
        currencyCount,
        currencyToBuy,
        currencyToSell,
        currencyToBuyPriceInUsd,
        currencyToSellPriceInUsd,
        currencyNameSecondWallet
      ];
}

enum LoadDataType {
  coinDetails,
  secondWalletDetails,
  change,
  allCoins,
  buyCoin,
  sellCoin,
}
