import '../models/currency_model.dart';

abstract class CurrencyRepository {
  Future<List<CurrencyModel>> getCurrencies();
  Future<CurrencyModel> getCurrencyDetail(String code);
  Future<void> toggleFavorite(String code);
  Future<List<CurrencyModel>> getFavoriteCurrencies();
  Future<void> saveCurrencyList(List<CurrencyModel> currencies);
}