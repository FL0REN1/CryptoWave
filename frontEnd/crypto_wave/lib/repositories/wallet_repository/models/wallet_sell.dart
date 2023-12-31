import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'wallet_sell.g.dart';

@JsonSerializable()
class WalletSell extends Equatable {
  const WalletSell({
    this.currencyCount,
    this.currencyToBuy,
    this.currencyToSell,
    this.currencyToBuyPriceInUsd,
    this.currencyToSellPriceInUsd,
    required this.userId,
  });

  final double? currencyCount;
  final double? currencyToBuyPriceInUsd;
  final double? currencyToSellPriceInUsd;
  final String? currencyToBuy;
  final String? currencyToSell;
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
