// lib/data/network/rest_path.dart
abstract class RestPath {
  static const String dailyExchangeRateUrl = 
      'https://www.cbr-xml-daily.ru/daily_json.js';
  static const String newsUrl = 
      'https://www.cbr.ru/rss/eventrss/'; // Используем HTTPS и другой RSS
}