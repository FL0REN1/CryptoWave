import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'notifications_change_all.g.dart';

@JsonSerializable()
class NotificationsChangeAll extends Equatable {
  const NotificationsChangeAll({
    required this.userId,
  });

  final int userId;

  factory NotificationsChangeAll.fromJson(Map<String, dynamic> json) =>
      _$NotificationsChangeAllFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationsChangeAllToJson(this);

  @override
  List<Object?> get props => [userId];
}
