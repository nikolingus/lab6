import '../../../../domain/models/currency_model.dart';

class CurrencyModelMapper {
  static Map<String, dynamic> toMap(CurrencyModel currency) {
    return {
      'id': currency.id,
      'nominal': currency.nominal,
      'name': currency.name,
      'symbol': currency.symbol,
      'value': currency.value,
      'previous_value': currency.previousValue,
      'updated_at': DateTime.now().millisecondsSinceEpoch,
    };
  }

  static CurrencyModel fromMap(Map<String, dynamic> map) {
    return CurrencyModel(
      id: map['id'] as String,
      nominal: map['nominal'] as int,
      name: map['name'] as String,
      symbol: map['symbol'] as String,
      value: (map['value'] as num).toDouble(),
      previousValue: (map['previous_value'] as num).toDouble(),
    );
  }
}