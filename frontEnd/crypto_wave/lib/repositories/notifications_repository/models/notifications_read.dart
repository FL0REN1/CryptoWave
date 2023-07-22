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
      required this.isRead,
      required this.isChoosen});

  final int id;
  final int userId;
  final String type;
  final String text;
  final String date;
  final bool isRead;
  final bool isChoosen;

  factory NotificationsRead.fromJson(Map<String, dynamic> json) {
    return NotificationsRead(
      id: json['id'] as int? ?? 0,
      text: json['text'] as String? ?? '',
      date: json['date'] as String? ?? '',
      userId: json['userId'] as int? ?? 0,
      type: json['type'] as String? ?? '',
      isRead: json['isRead'] as bool? ?? false,
      isChoosen: json['isChoosen'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() => _$NotificationsReadToJson(this);

  @override
  List<Object?> get props => [id, userId, type, text, date, isRead];
}
