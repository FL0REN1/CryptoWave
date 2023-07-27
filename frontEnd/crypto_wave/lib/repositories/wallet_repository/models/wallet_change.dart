import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'wallet_change.g.dart';

@JsonSerializable()
class WalletChange extends Equatable {
  const WalletChange({
    required this.currencyCount,
    required this.currencyToBuy,
    required this.currencyToSell,
    required this.userId,
  });

  final double currencyCount;
  final String currencyToBuy;
  final String currencyToSell;
  final int userId;

  factory WalletChange.fromJson(Map<String, dynamic> json) =>
      _$WalletChangeFromJson(json);

  Map<String, dynamic> toJson() => _$WalletChangeToJson(this);

  @override
  List<Object?> get props => [currencyCount, currencyToBuy, currencyToSell, userId];
}
