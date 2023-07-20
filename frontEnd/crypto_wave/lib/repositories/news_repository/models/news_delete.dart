import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'news_delete.g.dart';

@JsonSerializable()
class NewsDelete extends Equatable {
  const NewsDelete({
    required this.id
  });

  final int id;

  factory NewsDelete.fromJson(Map<String, dynamic> json) =>
      _$NewsDeleteFromJson(json);

  Map<String, dynamic> toJson() => _$NewsDeleteToJson(this);

  @override
  List<Object?> get props => [id];
}
