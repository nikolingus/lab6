import '../models/news_model.dart';

abstract class NewsRepository {
  Future<List<NewsModel>> getNews();
  Future<List<NewsModel>> getNewsByCategory(String category);
  Future<void> saveNewsList(List<NewsModel> news);
}