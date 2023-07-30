import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'wallet_sell.g.dart';

@JsonSerializable()
class WalletSell extends Equatable {
  const WalletSell({
    required this.currencyCount,
    required this.currencyToBuy,
    required this.currencyToSell,
    required this.userId,
    required this.currencyToBuyPriceInUsd,
    required this.currencyToSellPriceInUsd,
  });

  final double currencyCount;
  final double currencyToBuyPriceInUsd;
  final double currencyToSellPriceInUsd;
  final String currencyToBuy;
  final String currencyToSell;
  final int userId;

  factory WalletSell.fromJson(Map<String, dynamic> json) =>
      _$WalletSellFromJson(json);

  Map<String, dynamic> toJson() => _$WalletSellToJson(this);

  @override
  List<Object?> get props => [
        currencyCount,
        currencyToBuyPriceInUsd,
        currencyToSellPriceInUsd,
        currencyToBuy,
        currencyToSell,
        userId,
      ];
}
