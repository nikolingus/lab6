import '../../domain/models/currency_model.dart';
import '../../domain/models/news_model.dart';

abstract class DbDatasource {
  // Валюты
  Future<List<CurrencyModel>> getCurrencies();
  Future<void> saveCurrencies(List<CurrencyModel> currencies);
  Future<void> clearCurrencies();
  
  // Новости
  Future<List<NewsModel>> getNews();
  Future<void> saveNews(List<NewsModel> news);
  Future<void> clearNews();
  
  // Инициализация БД
  Future<void> init();
  Future<void> close();
}