import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'notifications_delete_choosen.g.dart';

@JsonSerializable()
class NotificationsDeleteChoosen extends Equatable {
  const NotificationsDeleteChoosen({
    required this.id,
  });

  final int id;

  factory NotificationsDeleteChoosen.fromJson(Map<String, dynamic> json) =>
      _$NotificationsDeleteChoosenFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationsDeleteChoosenToJson(this);

  @override
  List<Object?> get props => [id];
}