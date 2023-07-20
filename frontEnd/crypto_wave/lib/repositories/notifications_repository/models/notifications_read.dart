import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'notifications_read.g.dart';

@JsonSerializable()
class NotificationsRead extends Equatable {
  const NotificationsRead(
      {required this.id,
      required this.text,
      required this.date,
      required this.userId,
      required this.type,
      required this.isRead});

  final int id;
  final int userId;
  final String type;
  final String text;
  final String date;
  final bool isRead;

  factory NotificationsRead.fromJson(Map<String, dynamic> json) =>
      _$NotificationsReadFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationsReadToJson(this);

  @override
  List<Object?> get props => [id, userId, type, text, date, isRead];
}
