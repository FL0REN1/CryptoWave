import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'notifications_change_single.g.dart';

@JsonSerializable()
class NotificationsChangeSingle extends Equatable {
  const NotificationsChangeSingle({
    required this.id,
  });

  final int id;

  factory NotificationsChangeSingle.fromJson(Map<String, dynamic> json) =>
      _$NotificationsChangeSingleFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationsChangeSingleToJson(this);

  @override
  List<Object?> get props => [id];
}
