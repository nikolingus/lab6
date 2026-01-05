class CurrencyModel {
  const CurrencyModel({
    required this.id,
    required this.nominal,
    required this.name,
    required this.symbol,
    required this.value,
    required this.previousValue,
  });

  final String id;
  final int nominal;
  final String name;
  final String symbol;
  final double value;
  final double previousValue;

  /// Изменение курса в рублях
  double get changeAmount => value - previousValue;

  /// Изменение курса в процентах
  double get changePercent => previousValue != 0 
      ? ((value - previousValue) / previousValue) * 100 
      : 0;

  @override
  String toString() {
    return 'CurrencyModel(id: $id, nominal: $nominal, name: $name, symbol: $symbol, value: $value)';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CurrencyModel &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
}