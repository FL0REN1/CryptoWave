// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_create.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserCreate _$UserCreateFromJson(Map<String, dynamic> json) => UserCreate(
      fullName: json['fullName'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      isVerifiedMail: json['isVerifiedMail'] as bool,
      isVerifiedUser: json['isVerifiedUser'] as bool,
    );

Map<String, dynamic> _$UserCreateToJson(UserCreate instance) =>
    <String, dynamic>{
      'fullName': instance.fullName,
      'email': instance.email,
      'password': instance.password,
      'isVerifiedMail': instance.isVerifiedMail,
      'isVerifiedUser': instance.isVerifiedUser,
    };
