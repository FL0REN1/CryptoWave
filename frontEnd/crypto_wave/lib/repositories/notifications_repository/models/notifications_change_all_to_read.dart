import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'notifications_change_all_to_read.g.dart';

@JsonSerializable()
class NotificationsChangeAllToRead extends Equatable {
  const NotificationsChangeAllToRead({
    required this.userId,
  });

  final int userId;

  factory NotificationsChangeAllToRead.fromJson(Map<String, dynamic> json) =>
      _$NotificationsChangeAllToReadFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationsChangeAllToReadToJson(this);

  @override
  List<Object?> get props => [userId];
}
