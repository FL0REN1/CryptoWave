import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'wallet_change_favorite.g.dart';

@JsonSerializable()
class WalletChangeFavorite extends Equatable {
  const WalletChangeFavorite({required this.userId, required this.currencyName});

  final int userId;
  final String currencyName;

  factory WalletChangeFavorite.fromJson(Map<String, dynamic> json) =>
      _$WalletChangeFavoriteFromJson(json);

  Map<String, dynamic> toJson() => _$WalletChangeFavoriteToJson(this);

  @override
  List<Object?> get props => [userId, currencyName];
}
