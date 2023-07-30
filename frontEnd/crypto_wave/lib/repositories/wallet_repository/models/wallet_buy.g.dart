// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_buy.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WalletBuy _$WalletBuyFromJson(Map<String, dynamic> json) => WalletBuy(
      currencyCount: (json['currencyCount'] as num).toDouble(),
      currencyToBuy: json['currencyToBuy'] as String,
      currencyToSell: json['currencyToSell'] as String,
      userId: json['userId'] as int,
      currencyToBuyPriceInUsd:
          (json['currencyToBuyPriceInUsd'] as num).toDouble(),
      currencyToSellPriceInUsd:
          (json['currencyToSellPriceInUsd'] as num).toDouble(),
    );

Map<String, dynamic> _$WalletBuyToJson(WalletBuy instance) => <String, dynamic>{
      'currencyCount': instance.currencyCount,
      'currencyToBuyPriceInUsd': instance.currencyToBuyPriceInUsd,
      'currencyToSellPriceInUsd': instance.currencyToSellPriceInUsd,
      'currencyToBuy': instance.currencyToBuy,
      'currencyToSell': instance.currencyToSell,
      'userId': instance.userId,
    };
