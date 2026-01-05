import '../../domain/models/currency_model.dart';

abstract interface class CurrencyRepository {
  Future<List<CurrencyModel>> getCurrencies();
  Future<CurrencyModel> getCurrencyDetail(String id);
  Future<List<CurrencyModel>> getFavoriteCurrencies();
  Future<void> toggleFavorite(String currencyId);
}