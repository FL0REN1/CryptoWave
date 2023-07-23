// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_change.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WalletChange _$WalletChangeFromJson(Map<String, dynamic> json) => WalletChange(
      currencyCount: json['currencyCount'] as int,
      currencyToBuy: json['currencyToBuy'] as String,
      currencyToSell: json['currencyToSell'] as String,
      userId: json['userId'] as int,
    );

Map<String, dynamic> _$WalletChangeToJson(WalletChange instance) =>
    <String, dynamic>{
      'currencyCount': instance.currencyCount,
      'currencyToBuy': instance.currencyToBuy,
      'currencyToSell': instance.currencyToSell,
      'userId': instance.userId,
    };
