import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'wallet_create.g.dart';

@JsonSerializable()
class WalletCreate extends Equatable {
  const WalletCreate({
    required this.currencyCount,
    required this.currencyName,
    required this.userId,
  });

  final double currencyCount;
  final String currencyName;
  final int userId;

  factory WalletCreate.fromJson(Map<String, dynamic> json) =>
      _$WalletCreateFromJson(json);

  Map<String, dynamic> toJson() => _$WalletCreateToJson(this);

  @override
  List<Object?> get props => [currencyCount, currencyName, userId];
}
