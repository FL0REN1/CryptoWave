// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_read.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WalletRead _$WalletReadFromJson(Map<String, dynamic> json) => WalletRead(
      id: json['id'] as int,
      currencyCount: (json['currencyCount'] as num).toDouble(),
      currencyName: json['currencyName'] as String,
      userId: json['userId'] as int,
      isFavorite: json['isFavorite'] as bool,
    );

Map<String, dynamic> _$WalletReadToJson(WalletRead instance) =>
    <String, dynamic>{
      'id': instance.id,
      'currencyCount': instance.currencyCount,
      'currencyName': instance.currencyName,
      'isFavorite': instance.isFavorite,
      'userId': instance.userId,
    };
