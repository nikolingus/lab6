// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrencyDto _$CurrencyDtoFromJson(Map<String, dynamic> json) => CurrencyDto(
      id: json['ID'] as String,
      numCode: json['NumCode'] as String,
      charCode: json['CharCode'] as String,
      nominal: (json['Nominal'] as num).toInt(),
      name: json['Name'] as String,
      value: (json['Value'] as num).toDouble(),
      previous: (json['Previous'] as num).toDouble(),
    );

CurrencyResponseDto _$CurrencyResponseDtoFromJson(Map<String, dynamic> json) =>
    CurrencyResponseDto(
      date: json['Date'] as String,
      previousDate: json['PreviousDate'] as String,
      previousURL: json['PreviousURL'] as String,
      timestamp: json['Timestamp'] as String,
      valute: (json['Valute'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, CurrencyDto.fromJson(e as Map<String, dynamic>)),
      ),
    );
