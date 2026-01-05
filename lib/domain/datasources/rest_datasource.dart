import '../../domain/models/currency_model.dart';
import '../../domain/models/news_model.dart';

abstract interface class RestDatasource {
  Future<List<CurrencyModel>> fetchCurrencies();
  Future<Map<String, dynamic>> fetchCurrencyDetail(String code);
  Future<List<NewsModel>> fetchNews();
  Future<List<NewsModel>> fetchNewsByCategory(String category);
  Future<List<Map<String, dynamic>>> getCurrencyList();
}