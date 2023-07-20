import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'notifications_change.g.dart';

@JsonSerializable()
class NotificationsChange extends Equatable {
  const NotificationsChange({
    required this.userId,
  });

  final int userId;

  factory NotificationsChange.fromJson(Map<String, dynamic> json) =>
      _$NotificationsChangeFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationsChangeToJson(this);

  @override
  List<Object?> get props => [userId];
}
