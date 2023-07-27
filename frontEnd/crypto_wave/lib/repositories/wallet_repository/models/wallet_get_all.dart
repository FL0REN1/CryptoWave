import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'wallet_get_all.g.dart';

@JsonSerializable()
class WalletGetAll extends Equatable {
  const WalletGetAll({
    required this.userId,
  });

  final int userId;

  factory WalletGetAll.fromJson(Map<String, dynamic> json) =>
      _$WalletGetAllFromJson(json);

  Map<String, dynamic> toJson() => _$WalletGetAllToJson(this);

  @override
  List<Object?> get props => [userId];
}
