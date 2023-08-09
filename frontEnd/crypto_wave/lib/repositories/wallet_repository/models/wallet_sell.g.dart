// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_sell.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WalletSell _$WalletSellFromJson(Map<String, dynamic> json) => WalletSell(
      currencyCount: (json['currencyCount'] as num?)?.toDouble(),
      currencyToBuy: json['currencyToBuy'] as String?,
      currencyToSell: json['currencyToSell'] as String?,
      currencyToBuyPriceInUsd:
          (json['currencyToBuyPriceInUsd'] as num?)?.toDouble(),
      currencyToSellPriceInUsd:
          (json['currencyToSellPriceInUsd'] as num?)?.toDouble(),
      userId: json['userId'] as int,
    );

Map<String, dynamic> _$WalletSellToJson(WalletSell instance) =>
    <String, dynamic>{
      'currencyCount': instance.currencyCount,
      'currencyToBuyPriceInUsd': instance.currencyToBuyPriceInUsd,
      'currencyToSellPriceInUsd': instance.currencyToSellPriceInUsd,
      'currencyToBuy': instance.currencyToBuy,
      'currencyToSell': instance.currencyToSell,
      'userId': instance.userId,
    };
