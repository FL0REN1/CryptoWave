// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_change.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsChange _$NewsChangeFromJson(Map<String, dynamic> json) => NewsChange(
      id: json['id'] as int,
      text: json['text'] as String,
      date: json['date'] as String,
    );

Map<String, dynamic> _$NewsChangeToJson(NewsChange instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'date': instance.date,
    };
