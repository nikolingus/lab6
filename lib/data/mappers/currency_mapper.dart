import '../../domain/models/currency_model.dart';
import '../dto/currency_dto.dart';

extension CurrencyDtoMapper on CurrencyDto {
  CurrencyModel toDomain() {
    return CurrencyModel(
      id: id,
      nominal: nominal,
      name: name,
      symbol: charCode,
      value: value,
      previousValue: previous,
    );
  }
}