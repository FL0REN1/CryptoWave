import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_read.g.dart';

@JsonSerializable()
class UserRead extends Equatable {
  const UserRead({
    required this.id,
    required this.fullName,
    required this.email,
    required this.password,
    required this.isVerifiedMail,
    required this.isVerifiedUser,
  });

  final int id;
  final String fullName;
  final String email;
  final String password;
  final bool isVerifiedMail;
  final bool isVerifiedUser;

  factory UserRead.fromJson(Map<String, dynamic> json) =>
      _$UserReadFromJson(json);

  Map<String, dynamic> toJson() => _$UserReadToJson(this);

  @override
  List<Object?> get props =>
      [id, fullName, email, password, isVerifiedMail, isVerifiedUser];
}
