import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'coins_trade.g.dart';

@JsonSerializable()
class CoinsTrade extends Equatable {
  const CoinsTrade(
      {required this.time,
      required this.high,
      required this.low,
      required this.open,
      required this.close});

  final int time;
  final double open;
  final double high;
  final double low;
  final double close;

  factory CoinsTrade.fromJson(Map<String, dynamic> json) {
    return CoinsTrade(
      time: json['time'] as int? ?? 0,
      high: (json['high'] as num?)?.toDouble() ?? 0.0,
      low: (json['low'] as num?)?.toDouble() ?? 0.0,
      open: (json['open'] as num?)?.toDouble() ?? 0.0,
      close: (json['close'] as num?)?.toDouble() ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() => _$CoinsTradeToJson(this);

  @override
  List<Object?> get props => [time, open, high, low, close];
}
