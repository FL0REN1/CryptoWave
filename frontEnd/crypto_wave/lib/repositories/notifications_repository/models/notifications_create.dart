import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'notifications_create.g.dart';

@JsonSerializable()
class NotificationsCreate extends Equatable {
  const NotificationsCreate(
      {required this.text,
      required this.date,
      required this.userId,
      required this.type});

  final int userId;
  final String type;
  final String text;
  final String date;

  factory NotificationsCreate.fromJson(Map<String, dynamic> json) =>
      _$NotificationsCreateFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationsCreateToJson(this);

  @override
  List<Object?> get props => [userId, type, text, date];
}
