import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'coins_details.g.dart';

@JsonSerializable()
class CoinsDetails extends Equatable {
  const CoinsDetails({
    required this.toSymbol,
    required this.highDay,
    required this.lowDay,
    required this.priceInUSD,
    required this.precentInUSD,
    required this.imageUrl,
  });

  @JsonKey(name: 'TOSYMBOL')
  final String toSymbol;
  @JsonKey(name: 'PRICE')
  final double priceInUSD;
  @JsonKey(name: 'CHANGEPCT24HOUR')
  final double precentInUSD;
  @JsonKey(name: 'IMAGEURL')
  final String imageUrl;
  @JsonKey(name: 'HIGHDAY')
  final double highDay;
  @JsonKey(name: 'LOWDAY')
  final double lowDay;

  String get fullImageUrl => 'https://www.cryptocompare.com/$imageUrl';
  String get fullPrecentInUSD => precentInUSD.toStringAsFixed(2);

  factory CoinsDetails.fromJson(Map<String, dynamic> json) =>
      _$CoinsDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$CoinsDetailsToJson(this);

  @override
  List<Object?> get props => [priceInUSD, precentInUSD, imageUrl];
}
