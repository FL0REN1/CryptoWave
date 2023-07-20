// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifications_create.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationsCreate _$NotificationsCreateFromJson(Map<String, dynamic> json) =>
    NotificationsCreate(
      text: json['text'] as String,
      date: json['date'] as String,
      userId: json['userId'] as int,
      type: json['type'] as String,
    );

Map<String, dynamic> _$NotificationsCreateToJson(
        NotificationsCreate instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'type': instance.type,
      'text': instance.text,
      'date': instance.date,
    };
