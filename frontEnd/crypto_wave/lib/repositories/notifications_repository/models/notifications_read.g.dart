// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifications_read.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationsRead _$NotificationsReadFromJson(Map<String, dynamic> json) =>
    NotificationsRead(
      id: json['id'] as int,
      text: json['text'] as String,
      date: json['date'] as String,
      userId: json['userId'] as int,
      type: json['type'] as String,
      isRead: json['isRead'] as bool,
    );

Map<String, dynamic> _$NotificationsReadToJson(NotificationsRead instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'type': instance.type,
      'text': instance.text,
      'date': instance.date,
      'isRead': instance.isRead,
    };
