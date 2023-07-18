// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coins_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoinsDetails _$CoinDetailsFromJson(Map<String, dynamic> json) => CoinsDetails(
      json['TOSYMBOL'] as String,
      priceInUSD: (json['PRICE'] as num).toDouble(),
      precentInUSD: (json['CHANGEPCT24HOUR'] as num).toDouble(),
      imageUrl: json['IMAGEURL'] as String,
    );

Map<String, dynamic> _$CoinDetailsToJson(CoinsDetails instance) =>
    <String, dynamic>{
      'TOSYMBOL': instance.toSymbol,
      'PRICE': instance.priceInUSD,
      'CHANGEPCT24HOUR': instance.precentInUSD,
      'IMAGEURL': instance.imageUrl,
    };
