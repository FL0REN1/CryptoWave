// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_create.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WalletCreate _$WalletCreateFromJson(Map<String, dynamic> json) => WalletCreate(
      currencyCount: (json['currencyCount'] as num).toDouble(),
      currencyName: json['currencyName'] as String,
      userId: json['userId'] as int,
    );

Map<String, dynamic> _$WalletCreateToJson(WalletCreate instance) =>
    <String, dynamic>{
      'currencyCount': instance.currencyCount,
      'currencyName': instance.currencyName,
      'userId': instance.userId,
    };
