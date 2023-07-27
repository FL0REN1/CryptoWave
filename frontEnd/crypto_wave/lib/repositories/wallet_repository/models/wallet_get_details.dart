import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'wallet_get_details.g.dart';

@JsonSerializable()
class WalletGetDetails extends Equatable {
  const WalletGetDetails({
    required this.currencyName,
    required this.userId,
  });

  final int userId;
  final String currencyName;

  factory WalletGetDetails.fromJson(Map<String, dynamic> json) =>
      _$WalletGetDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$WalletGetDetailsToJson(this);

  @override
  List<Object?> get props => [userId, currencyName];
}
