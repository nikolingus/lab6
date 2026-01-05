import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rss_dart/dart_rss.dart';
import 'package:intl/intl.dart';
import '../../domain/datasources/rest_datasource.dart';
import '../../domain/models/currency_model.dart';
import '../../domain/models/news_model.dart';

class RestDatasourceImpl implements RestDatasource {
  final http.Client _client = http.Client();

  // URL для RSS новостей ЦБ РФ
  static const String _newsUrl = 'https://www.cbr.ru/rss/RssNews';
  
  // URL для курсов валют
  static const String _currencyUrl = 'https://www.cbr-xml-daily.ru/daily_json.js';

  @override
  Future<List<CurrencyModel>> fetchCurrencies() async {
    try {
      final response = await _client.get(Uri.parse(_currencyUrl));
      
      if (response.statusCode != 200) {
        throw Exception('Ошибка загрузки курсов валют: ${response.statusCode}');
      }

      final body = utf8.decode(response.bodyBytes);
      final jsonData = jsonDecode(body);
      
      // Получаем список валют из JSON
      final valuteMap = jsonData['Valute'] as Map<String, dynamic>;
      
      final List<CurrencyModel> currencies = [];
      
      valuteMap.forEach((key, value) {
        currencies.add(CurrencyModel(
          id: value['ID']?.toString() ?? '',
          nominal: (value['Nominal'] as num?)?.toInt() ?? 1,
          name: value['Name']?.toString() ?? '',
          symbol: value['CharCode']?.toString() ?? '',
          value: (value['Value'] as num?)?.toDouble() ?? 0.0,
          previousValue: (value['Previous'] as num?)?.toDouble() ?? 0.0,
        ));
      });
      
      return currencies;
      
    } catch (e) {
      throw Exception('Ошибка при загрузке курсов валют: $e');
    }
  }

  @override
  Future<Map<String, dynamic>> fetchCurrencyDetail(String code) async {
    try {
      final currencies = await fetchCurrencies();
      final currency = currencies.firstWhere(
        (c) => c.symbol == code,
        orElse: () => throw Exception('Валюта $code не найдена'),
      );

      // Возвращаем детали валюты с дополнительной информацией
      return {
        'currency': currency,
        'description': 'Курс ${currency.name} (${currency.symbol})',
        'lastUpdated': DateTime.now().toIso8601String(),
        'changeAmount': currency.value - currency.previousValue,
        'changePercent': ((currency.value - currency.previousValue) / currency.previousValue * 100).toStringAsFixed(2),
      };
    } catch (e) {
      throw Exception('Ошибка при загрузке деталей валюты: $e');
    }
  }

  @override
  Future<List<NewsModel>> fetchNews() async {
    try {
      // Выполняем HTTP-запрос
      final response = await _client.get(Uri.parse(_newsUrl));
      
      if (response.statusCode != 200) {
        throw Exception('Ошибка загрузки RSS: ${response.statusCode}');
      }

      // Декодируем ответ с правильной кодировкой
      final body = utf8.decode(response.bodyBytes);
      
      // Парсим RSS
      final RssFeed feed = RssFeed.parse(body);
      
      // Преобразуем RSS элементы в NewsModel
      final List<NewsModel> newsList = feed.items.map(_rssItemToNewsModel).toList(growable: false);
      
      return newsList;
      
    } catch (e) {
      throw Exception('Ошибка при загрузке новостей: $e');
    }
  }

  @override
  Future<List<NewsModel>> fetchNewsByCategory(String category) async {
    // Получаем все новости
    final allNews = await fetchNews();
    
    // Если категория не указана или "all", возвращаем все новости
    if (category.isEmpty || category == 'all') {
      return allNews;
    }
    
    // Фильтруем новости по ключевым словам в заголовке
    final filteredNews = allNews.where((news) {
      final title = news.title.toLowerCase();
      
      // Простая фильтрация по ключевым словам
      switch (category.toLowerCase()) {
        case 'экономика':
          return title.contains('экономик') || 
                 title.contains('финанс') || 
                 title.contains('курс') ||
                 title.contains('валют');
        case 'банкинг':
          return title.contains('банк') || 
                 title.contains('кредит') || 
                 title.contains('депозит');
        case 'регулирование':
          return title.contains('регулирован') || 
                 title.contains('норматив') || 
                 title.contains('закон') ||
                 title.contains('указание');
        default:
          return true;
      }
    }).toList();
    
    return filteredNews;
  }

  @override
  Future<List<Map<String, dynamic>>> getCurrencyList() async {
    try {
      final currencies = await fetchCurrencies();
      
      return currencies.map((currency) {
        final changeAmount = currency.value - currency.previousValue;
        final changePercent = (changeAmount / currency.previousValue * 100);
        
        return {
          'code': currency.symbol,
          'name': currency.name,
          'country': '', // Можно добавить страну, если есть в данных
          'price': currency.value,
          'change_24h': changeAmount,
          'change_percent': changePercent,
          'is_favorite': false,
          'nominal': currency.nominal,
        };
      }).toList();
      
    } catch (e) {
      throw Exception('Ошибка при получении списка валют: $e');
    }
  }

  // Вспомогательный метод для преобразования RSS элемента в NewsModel
  NewsModel _rssItemToNewsModel(RssItem item) {
    DateTime? parsedDate;
    
    if (item.pubDate != null && item.pubDate!.isNotEmpty) {
      try {
        // RSS формат: "Thu, 25 Dec 2025 15:00:54 +0300"
        parsedDate = DateFormat('EEE, dd MMM yyyy HH:mm:ss Z', 'en_US')
            .parse(item.pubDate!);
      } catch (e) {
        // Если не удалось распарсить дату, оставляем null
      }
    }

    return NewsModel(
      title: item.title ?? 'Без заголовка',
      link: item.link ?? '',
      date: parsedDate,
    );
  }

  void dispose() {
    _client.close();
  }
}