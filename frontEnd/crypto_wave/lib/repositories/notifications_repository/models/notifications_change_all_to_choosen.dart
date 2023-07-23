import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'notifications_change_all_to_choosen.g.dart';

@JsonSerializable()
class NotificationsChangeAllToChoosen extends Equatable {
  const NotificationsChangeAllToChoosen({
    required this.userId,
  });

  final int userId;

  factory NotificationsChangeAllToChoosen.fromJson(Map<String, dynamic> json) =>
      _$NotificationsChangeAllToChoosenFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationsChangeAllToChoosenToJson(this);

  @override
  List<Object?> get props => [userId];
}
