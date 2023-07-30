part of 'coin_bloc.dart';

class CoinState extends Equatable {
  const CoinState();

  @override
  List<Object?> get props => [];
}

class CoinLoading extends CoinState {
  const CoinLoading();

  @override
  List<Object?> get props => [];
}

class CoinLoaded extends CoinState {
  final Coins? coin;
  final List<Coins>? listCoins;
  final WalletRead? wallet;

  const CoinLoaded({
    this.coin,
    this.wallet,
    this.listCoins,
  });

  @override
  List<Object?> get props => [coin, wallet, listCoins];
}

class CoinLoadingFailure extends CoinState {
  final Object exception;

  const CoinLoadingFailure(this.exception);

  @override
  List<Object?> get props => super.props..add(exception);
}
