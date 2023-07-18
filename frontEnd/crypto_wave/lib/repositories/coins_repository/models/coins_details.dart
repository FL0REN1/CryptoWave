import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'coins_details.g.dart';

@JsonSerializable()
class CoinsDetails extends Equatable {
  const CoinsDetails(this.toSymbol, {
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

  String get fullImageUrl => 'https://www.cryptocompare.com/$imageUrl';

  factory CoinsDetails.fromJson(Map<String, dynamic> json) =>
      _$CoinDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$CoinDetailsToJson(this);

  @override
  List<Object?> get props => [priceInUSD, precentInUSD, imageUrl];
}
