// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coins_trade.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoinsTrade _$CoinsTradeFromJson(Map<String, dynamic> json) => CoinsTrade(
      time: json['time'] as int? ?? 0,
      high: (json['high'] as num?)?.toDouble() ?? 0.0,
      low: (json['low'] as num?)?.toDouble() ?? 0.0,
      open: (json['open'] as num?)?.toDouble() ?? 0.0,
      close: (json['close'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$CoinsTradeToJson(CoinsTrade instance) =>
    <String, dynamic>{
      'time': instance.time,
      'open': instance.open,
      'high': instance.high,
      'low': instance.low,
      'close': instance.close,
    };
