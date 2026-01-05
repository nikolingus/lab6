import '../../domain/datasources/rest_datasource.dart';
import '../../domain/datasources/db_datasource.dart';
import '../../domain/models/news_model.dart';
import '../../domain/repositories/news_repository.dart';

class NewsRepositoryImpl implements NewsRepository {
  final RestDatasource _restDatasource;
  final DbDatasource? _dbDatasource;
  final bool _useLocalDataSource;

  NewsRepositoryImpl(
    this._restDatasource, {
    DbDatasource? dbDatasource,
    bool useLocalDataSource = false,
  }) : _dbDatasource = dbDatasource,
       _useLocalDataSource = useLocalDataSource;

  @override
  Future<List<NewsModel>> getNews() async {
    try {
      // Если используем локальные данные и есть доступ к БД
      if (_useLocalDataSource && _dbDatasource != null) {
        final localNews = await _dbDatasource!.getNews();
        if (localNews.isNotEmpty) {
          // Асинхронно обновляем из сети
          _updateFromNetwork();
          return localNews;
        }
      }
      
      // Получаем данные из сети
      final news = await _restDatasource.fetchNews();
      
      // Сохраняем в локальную БД если она доступна
      if (_dbDatasource != null) {
        await _dbDatasource!.saveNews(news);
      }
      
      return news;
    } catch (e) {
      // Если ошибка сети, пробуем получить из локальной БД
      if (_dbDatasource != null) {
        final localNews = await _dbDatasource!.getNews();
        if (localNews.isNotEmpty) {
          return localNews;
        }
      }
      rethrow;
    }
  }

  @override
  Future<List<NewsModel>> getNewsByCategory(String category) async {
    final allNews = await getNews();
    
    if (category.isEmpty || category == 'all') {
      return allNews;
    }
    
    return allNews.where((news) {
      final title = news.title.toLowerCase();
      
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
  }

  @override
  Future<void> saveNewsList(List<NewsModel> news) async {
    if (_dbDatasource != null) {
      await _dbDatasource!.saveNews(news);
    } else {
      throw Exception('Local database is not available');
    }
  }

  Future<void> _updateFromNetwork() async {
    try {
      final news = await _restDatasource.fetchNews();
      if (_dbDatasource != null) {
        await _dbDatasource!.saveNews(news);
      }
    } catch (e) {
      print('Background news update failed: $e');
    }
  }
}