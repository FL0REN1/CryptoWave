import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'notifications_delete_all.g.dart';

@JsonSerializable()
class NotificationsDeleteAll extends Equatable {
  const NotificationsDeleteAll({
    required this.userId,
  });

  final int userId;

  factory NotificationsDeleteAll.fromJson(Map<String, dynamic> json) =>
      _$NotificationsDeleteAllFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationsDeleteAllToJson(this);

  @override
  List<Object?> get props => [userId];
}