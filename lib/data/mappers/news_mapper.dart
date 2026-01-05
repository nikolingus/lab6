import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import '../../domain/models/news_model.dart';

// Удаляем зависимость от rss_dart, так как мы парсим XML вручную
// import 'package:rss_dart/dart_rss.dart'; // УДАЛИТЬ эту строку

// Новый маппер для Map<String, dynamic> (из ручного парсинга)
extension NewsMapMapper on Map<String, dynamic> {
  NewsModel toDomain() {
    DateTime? parsedDate;
    final String? pubDate = this['pubDate'] as String?;
    
    if (pubDate != null) {
      try {
        // Пробуем несколько форматов дат с русской локалью
        final formats = [
          'EEE, dd MMM yyyy HH:mm:ss Z',
          'EEE, dd MMM yyyy HH:mm:ss',
          'yyyy-MM-dd HH:mm:ss',
          'dd MMM yyyy HH:mm:ss',
          'EEE, dd MMM yyyy HH:mm:ss',
        ];
        
        bool dateParsed = false;
        
        for (final format in formats) {
          try {
            final dateFormat = DateFormat(format, 'ru_RU');
            parsedDate = dateFormat.parse(pubDate);
            dateParsed = true;
            break;
          } catch (_) {
            continue;
          }
        }
        
        // Если не удалось распарсить с русской локалью, пробуем английскую
        if (!dateParsed) {
          for (final format in formats) {
            try {
              final dateFormat = DateFormat(format, 'en_US');
              parsedDate = dateFormat.parse(pubDate);
              break;
            } catch (_) {
              continue;
            }
          }
        }
      } catch (e) {
        print('Error parsing date in mapper: $e');
        parsedDate = DateTime.now();
      }
    } else {
      parsedDate = DateTime.now();
    }
    
    return NewsModel(
      title: (this['title'] as String?) ?? 'Новость ЦБ РФ',
      link: (this['link'] as String?) ?? 'https://www.cbr.ru',
      date: parsedDate,
    );
  }
}

// Альтернативный маппер для XML-ноды (если парсите XML)
extension XmlNodeMapper on Map<String, dynamic> {
  NewsModel fromXmlNode() {
    final title = (this['title'] as String?) ?? 'Новость ЦБ РФ';
    final link = (this['link'] as String?) ?? 'https://www.cbr.ru';
    final pubDate = this['pubDate'] as String?;
    
    DateTime? parsedDate;
    
    if (pubDate != null) {
      try {
        // Убираем лишние пробелы и символы
        final cleanDate = pubDate.trim();
        
        // Обрабатываем русские названия месяцев
        final russianMonths = {
          'янв': 'Jan', 'фев': 'Feb', 'мар': 'Mar', 'апр': 'Apr',
          'май': 'May', 'июн': 'Jun', 'июл': 'Jul', 'авг': 'Aug',
          'сен': 'Sep', 'окт': 'Oct', 'ноя': 'Nov', 'дек': 'Dec'
        };
        
        String englishDate = cleanDate;
        for (final entry in russianMonths.entries) {
          if (cleanDate.contains(entry.key)) {
            englishDate = cleanDate.replaceAll(entry.key, entry.value);
            break;
          }
        }
        
        // Пробуем стандартные форматы
        final dateFormats = [
          'EEE, dd MMM yyyy HH:mm:ss Z',
          'EEE, dd MMM yyyy HH:mm:ss',
          'yyyy-MM-dd HH:mm:ss',
        ];
        
        for (final format in dateFormats) {
          try {
            final dateFormat = DateFormat(format, 'en_US');
            parsedDate = dateFormat.parse(englishDate);
            break;
          } catch (_) {
            continue;
          }
        }
        
        if (parsedDate == null) {
          parsedDate = DateTime.now();
        }
      } catch (e) {
        print('Error parsing XML date: $e');
        parsedDate = DateTime.now();
      }
    } else {
      parsedDate = DateTime.now();
    }
    
    return NewsModel(
      title: _cleanText(title),
      link: link,
      date: parsedDate,
    );
  }
  
  String _cleanText(String text) {
    return text
        .replaceAll(RegExp(r'<[^>]*>'), '')
        .replaceAll('&nbsp;', ' ')
        .replaceAll('&amp;', '&')
        .replaceAll('&quot;', '"')
        .replaceAll('&lt;', '<')
        .replaceAll('&gt;', '>')
        .replaceAll(RegExp(r'\s+'), ' ')
        .trim();
  }
}