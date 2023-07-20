// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coins_trade.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoinsTrade _$CoinsTradeFromJson(Map<String, dynamic> json) => CoinsTrade(
      time: json['time'] as int,
      high: (json['high'] as num).toDouble(),
      low: (json['low'] as num).toDouble(),
      open: (json['open'] as num).toDouble(),
      close: (json['close'] as num).toDouble(),
    );

Map<String, dynamic> _$CoinsTradeToJson(CoinsTrade instance) =>
    <String, dynamic>{
      'time': instance.time,
      'open': instance.open,
      'high': instance.high,
      'low': instance.low,
      'close': instance.close,
    };
