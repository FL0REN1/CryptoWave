// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_change.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserChange _$UserChangeFromJson(Map<String, dynamic> json) => UserChange(
      id: json['id'] as int,
      fullName: json['fullName'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      isVerifiedMail: json['isVerifiedMail'] as bool,
      isVerifiedUser: json['isVerifiedUser'] as bool,
    );

Map<String, dynamic> _$UserChangeToJson(UserChange instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'email': instance.email,
      'password': instance.password,
      'isVerifiedMail': instance.isVerifiedMail,
      'isVerifiedUser': instance.isVerifiedUser,
    };
