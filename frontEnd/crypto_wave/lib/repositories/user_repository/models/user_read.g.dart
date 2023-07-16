// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_read.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserRead _$UserReadFromJson(Map<String, dynamic> json) => UserRead(
      id: json['id'] as int,
      fullName: json['fullName'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      isVerifiedMail: json['isVerifiedMail'] as bool,
      isVerifiedUser: json['isVerifiedUser'] as bool,
    );

Map<String, dynamic> _$UserReadToJson(UserRead instance) => <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'email': instance.email,
      'password': instance.password,
      'isVerifiedMail': instance.isVerifiedMail,
      'isVerifiedUser': instance.isVerifiedUser,
    };
