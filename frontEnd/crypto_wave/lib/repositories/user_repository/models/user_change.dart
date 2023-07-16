import 'package:equatable/equatable.dart';

class UserChange extends Equatable {
  const UserChange(
    this.id,
    this.fullName,
    this.email,
    this.password,
    this.isVerifiedMail,
    this.isVerifiedUser,
  );

  final int id;
  final String fullName;
  final String email;
  final String password;
  final bool isVerifiedMail;
  final bool isVerifiedUser;

  @override
  List<Object?> get props =>
      [id, fullName, email, password, isVerifiedMail, isVerifiedUser];
}
