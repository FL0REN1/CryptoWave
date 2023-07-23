import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'wallet_read.g.dart';

@JsonSerializable()
class WalletRead extends Equatable {
  const WalletRead({
    required this.id,
    required this.currencyCount,
    required this.currencyName,
    required this.userId,
  });

  final int id;
  final int currencyCount;
  final String currencyName;
  final int userId;

  factory WalletRead.fromJson(Map<String, dynamic> json) =>
      _$WalletReadFromJson(json);

  Map<String, dynamic> toJson() => _$WalletReadToJson(this);

  @override
  List<Object?> get props => [id, currencyCount, currencyName, userId];
}
