import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'notifications_change_to_choosen.g.dart';

@JsonSerializable()
class NotificationsChangeToChoosen extends Equatable {
  const NotificationsChangeToChoosen({
    required this.id,
  });

  final int id;

  factory NotificationsChangeToChoosen.fromJson(Map<String, dynamic> json) =>
      _$NotificationsChangeToChoosenFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationsChangeToChoosenToJson(this);

  @override
  List<Object?> get props => [id];
}
