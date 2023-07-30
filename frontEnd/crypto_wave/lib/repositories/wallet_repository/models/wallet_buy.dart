import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'wallet_buy.g.dart';

@JsonSerializable()
class WalletBuy extends Equatable {
  const WalletBuy({
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

  factory WalletBuy.fromJson(Map<String, dynamic> json) =>
      _$WalletBuyFromJson(json);

  Map<String, dynamic> toJson() => _$WalletBuyToJson(this);

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
