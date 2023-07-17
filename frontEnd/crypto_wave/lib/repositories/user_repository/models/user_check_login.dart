import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_check_login.g.dart';

@JsonSerializable()
class UserCheckLogin extends Equatable {
  const UserCheckLogin({required this.email, required this.password});

  final String email;
  final String password;

  factory UserCheckLogin.fromJson(Map<String, dynamic> json) =>
      _$UserCheckLoginFromJson(json);

  Map<String, dynamic> toJson() => _$UserCheckLoginToJson(this);

  @override
  List<Object?> get props => [email, password];
}
