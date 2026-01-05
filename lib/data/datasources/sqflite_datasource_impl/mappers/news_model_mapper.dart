import 'package:intl/intl.dart';
import '../../../../domain/models/news_model.dart';

class NewsModelMapper {
  static Map<String, dynamic> toMap(NewsModel news) {
    return {
      'title': news.title,
      'link': news.link,
      'date': news.date?.toIso8601String(),
    };
  }

  static NewsModel fromMap(Map<String, dynamic> map) {
    DateTime? date;
    if (map['date'] != null) {
      date = DateTime.tryParse(map['date'] as String);
    }
    
    return NewsModel(
      title: map['title'] as String,
      link: map['link'] as String,
      date: date,
    );
  }
}