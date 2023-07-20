import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'news_read.g.dart';

@JsonSerializable()
class NewsRead extends Equatable {
  const NewsRead({
    required this.id,
    required this.text,
    required this.date,
  });

  final int id;
  final String text;
  final String date;

  factory NewsRead.fromJson(Map<String, dynamic> json) =>
      _$NewsReadFromJson(json);

  Map<String, dynamic> toJson() => _$NewsReadToJson(this);

  @override
  List<Object?> get props => [id, text, date];
}
