import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'news_create.g.dart';

@JsonSerializable()
class NewsCreate extends Equatable {
  const NewsCreate({
    required this.text,
    required this.date,
  });

  final String text;
  final String date;

  factory NewsCreate.fromJson(Map<String, dynamic> json) =>
      _$NewsCreateFromJson(json);

  Map<String, dynamic> toJson() => _$NewsCreateToJson(this);

  @override
  List<Object?> get props => [text, date];
}