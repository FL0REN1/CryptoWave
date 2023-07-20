// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coins_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoinsDetails _$CoinsDetailsFromJson(Map<String, dynamic> json) => CoinsDetails(
      toSymbol: json['TOSYMBOL'] as String,
      highDay: (json['HIGHDAY'] as num).toDouble(),
      lowDay: (json['LOWDAY'] as num).toDouble(),
      priceInUSD: (json['PRICE'] as num).toDouble(),
      precentInUSD: (json['CHANGEPCT24HOUR'] as num).toDouble(),
      imageUrl: json['IMAGEURL'] as String,
    );

Map<String, dynamic> _$CoinsDetailsToJson(CoinsDetails instance) =>
    <String, dynamic>{
      'TOSYMBOL': instance.toSymbol,
      'PRICE': instance.priceInUSD,
      'CHANGEPCT24HOUR': instance.precentInUSD,
      'IMAGEURL': instance.imageUrl,
      'HIGHDAY': instance.highDay,
      'LOWDAY': instance.lowDay,
    };
