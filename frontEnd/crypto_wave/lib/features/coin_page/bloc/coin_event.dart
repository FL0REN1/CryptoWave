part of 'coin_bloc.dart';

abstract class CoinEvent extends Equatable {
  const CoinEvent();

  @override
  List<Object?> get props => [];
}

class LoadCoin extends CoinEvent {
  final Completer? completer;
  final String currencyCode;
  final int userId;
  final String currencyName;

  const LoadCoin({
    required this.completer,
    required this.currencyCode,
    required this.userId,
    required this.currencyName,
  });

  @override
  List<Object> get props => [currencyCode, userId, currencyName];
}

class LoadFavoriteChangeCoin extends CoinEvent {
  final Completer? completer;
  final String currencyCode;
  final int userId;
  final String currencyName;

  const LoadFavoriteChangeCoin({
    required this.completer,
    required this.currencyCode,
    required this.userId,
    required this.currencyName,
  });

  @override
  List<Object> get props => [currencyCode, userId, currencyName];
}
