import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'notifications_delete.g.dart';

@JsonSerializable()
class NotificationsDelete extends Equatable {
  const NotificationsDelete({
    required this.id,
  });

  final int id;

  factory NotificationsDelete.fromJson(Map<String, dynamic> json) =>
      _$NotificationsDeleteFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationsDeleteToJson(this);

  @override
  List<Object?> get props => [id];
}
