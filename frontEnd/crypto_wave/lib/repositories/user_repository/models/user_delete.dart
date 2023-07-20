import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_delete.g.dart';

@JsonSerializable()
class UserDelete extends Equatable {
  const UserDelete({required this.id});

  final int id;

  factory UserDelete.fromJson(Map<String, dynamic> json) =>
      _$UserDeleteFromJson(json);

  Map<String, dynamic> toJson() => _$UserDeleteToJson(this);

  @override
  List<Object?> get props => [id];
}
