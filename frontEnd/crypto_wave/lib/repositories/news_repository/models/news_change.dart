import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'news_change.g.dart';

@JsonSerializable()
class NewsChange extends Equatable {
  const NewsChange({
    required this.id,
    required this.text,
    required this.date,
  });

  final int id;
  final String text;
  final String date;

  factory NewsChange.fromJson(Map<String, dynamic> json) =>
      _$NewsChangeFromJson(json);

  Map<String, dynamic> toJson() => _$NewsChangeToJson(this);

  @override
  List<Object?> get props => [id, text, date];
}