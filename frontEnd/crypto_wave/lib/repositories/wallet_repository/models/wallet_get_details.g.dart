// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_get_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WalletGetDetails _$WalletGetDetailsFromJson(Map<String, dynamic> json) =>
    WalletGetDetails(
      currencyName: json['currencyName'] as String,
      userId: json['userId'] as int,
    );

Map<String, dynamic> _$WalletGetDetailsToJson(WalletGetDetails instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'currencyName': instance.currencyName,
    };
