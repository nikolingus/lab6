import 'package:json_annotation/json_annotation.dart';

part 'news_dto.g.dart';

/// DTO для RSS новости (упрощенный вариант)
@JsonSerializable(createToJson: false)
class NewsItemDto {
  @JsonKey(name: 'title')
  final String title;

  @JsonKey(name: 'link')
  final String link;

  @JsonKey(name: 'pubDate')
  final String? pubDate;

  NewsItemDto({
    required this.title,
    required this.link,
    this.pubDate,
  });

  factory NewsItemDto.fromJson(Map<String, dynamic> json) =>
      _$NewsItemDtoFromJson(json);
}