// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_read.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsRead _$NewsReadFromJson(Map<String, dynamic> json) => NewsRead(
      id: json['id'] as int,
      text: json['text'] as String,
      date: json['date'] as String,
    );

Map<String, dynamic> _$NewsReadToJson(NewsRead instance) => <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'date': instance.date,
    };
