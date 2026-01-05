import '../../domain/models/news_model.dart';

abstract interface class NewsRepository {
  Future<List<NewsModel>> getNews();
  Future<List<NewsModel>> getNewsByCategory(String category);
}