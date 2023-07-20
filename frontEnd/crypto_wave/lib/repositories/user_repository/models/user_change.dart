import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_change.g.dart';

@JsonSerializable()
class UserChange extends Equatable {
  const UserChange({
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

  factory UserChange.fromJson(Map<String, dynamic> json) =>
      _$UserChangeFromJson(json);

  Map<String, dynamic> toJson() => _$UserChangeToJson(this);

  @override
  List<Object?> get props =>
      [id, fullName, email, password, isVerifiedMail, isVerifiedUser];
}
