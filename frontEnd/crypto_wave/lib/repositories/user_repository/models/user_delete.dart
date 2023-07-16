import 'package:equatable/equatable.dart';

class UserDelete extends Equatable {
  const UserDelete(this.id);

  final int id;

  @override
  List<Object?> get props => [id];
}
