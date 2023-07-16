import 'package:equatable/equatable.dart';

class UserCheckLogin extends Equatable {
  const UserCheckLogin(this.email, this.password);

  final String email;
  final String password;

  @override
  List<Object?> get props => [email, password];
}
