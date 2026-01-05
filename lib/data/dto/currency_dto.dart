import 'package:json_annotation/json_annotation.dart';

part 'currency_dto.g.dart';

/// DTO для одной валюты из API ЦБ РФ
@JsonSerializable(createToJson: false)
class CurrencyDto {
  @JsonKey(name: 'ID')
  final String id;

  @JsonKey(name: 'NumCode')
  final String numCode;

  @JsonKey(name: 'CharCode')
  final String charCode;

  @JsonKey(name: 'Nominal')
  final int nominal;

  @JsonKey(name: 'Name')
  final String name;

  @JsonKey(name: 'Value')
  final double value;

  @JsonKey(name: 'Previous')
  final double previous;

  CurrencyDto({
    required this.id,
    required this.numCode,
    required this.charCode,
    required this.nominal,
    required this.name,
    required this.value,
    required this.previous,
  });

  factory CurrencyDto.fromJson(Map<String, dynamic> json) =>
      _$CurrencyDtoFromJson(json);
}

/// DTO для всего ответа от API ЦБ РФ
@JsonSerializable(createToJson: false)
class CurrencyResponseDto {
  @JsonKey(name: 'Date')
  final String date;

  @JsonKey(name: 'PreviousDate')
  final String previousDate;

  @JsonKey(name: 'PreviousURL')
  final String previousURL;

  @JsonKey(name: 'Timestamp')
  final String timestamp;

  @JsonKey(name: 'Valute')
  final Map<String, CurrencyDto> valute;

  CurrencyResponseDto({
    required this.date,
    required this.previousDate,
    required this.previousURL,
    required this.timestamp,
    required this.valute,
  });

  factory CurrencyResponseDto.fromJson(Map<String, dynamic> json) =>
      _$CurrencyResponseDtoFromJson(json);
}