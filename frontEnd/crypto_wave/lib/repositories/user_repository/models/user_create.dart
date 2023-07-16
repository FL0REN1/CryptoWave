import 'package:equatable/equatable.dart';

class UserCreate extends Equatable {
  const UserCreate(
    this.fullName,
    this.email,
    this.password,
    this.isVerifiedMail,
    this.isVerifiedUser,
  );

  final String fullName;
  final String email;
  final String password;
  final bool isVerifiedMail;
  final bool isVerifiedUser;

  @override
  List<Object?> get props =>
      [fullName, email, password, isVerifiedMail, isVerifiedUser];
}
