import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_create.g.dart';

@JsonSerializable()
class UserCreate extends Equatable {
  const UserCreate({
    required this.fullName,
    required this.email,
    required this.password,
    required this.isVerifiedMail,
    required this.isVerifiedUser,
  });

  final String fullName;
  final String email;
  final String password;
  final bool isVerifiedMail;
  final bool isVerifiedUser;

    factory UserCreate.fromJson(Map<String, dynamic> json) =>
      _$UserCreateFromJson(json);

  Map<String, dynamic> toJson() => _$UserCreateToJson(this);

  @override
  List<Object?> get props =>
      [fullName, email, password, isVerifiedMail, isVerifiedUser];
}
