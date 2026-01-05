import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../domain/models/news_model.dart';
import '../../domain/repositories/news_repository.dart';
import '../../domain/repositories/settings_repository.dart';
import '../utils/context_ext.dart';
import 'widgets/news_card.dart';

class NewsListPage extends StatefulWidget {
  const NewsListPage({super.key});

  @override
  State<NewsListPage> createState() => _NewsListPageState();
}

class _NewsListPageState extends State<NewsListPage> {
  Future<List<NewsModel>>? _newsListFuture; // Делаем nullable вместо late
  late NewsRepository _newsRepository;
  bool _isRefreshing = false;
  bool _useLocalDataSource = false;

  @override
  void initState() {
    super.initState();
    // Инициализируем как пустой список сразу
    _newsListFuture = Future.value([]);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _newsRepository = context.read<NewsRepository>();
    final settingsRepo = context.read<SettingsRepository>();
    _useLocalDataSource = settingsRepo.useLocalDataSource;
    _loadNews();
  }

  Future<void> _loadNews() async {
    if (!_isRefreshing) {
      setState(() {
        _isRefreshing = true;
      });
    }

    try {
      final news = await _newsRepository.getNews();
      
      // Сохраняем в локальную БД (Этап 6)
      try {
        await _newsRepository.saveNewsList(news);
      } catch (e) {
        print('Ошибка при сохранении новостей в БД: $e');
      }
      
      setState(() {
        _newsListFuture = Future.value(news);
      });
    } finally {
      if (_isRefreshing) {
        setState(() {
          _isRefreshing = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final fonts = context.fonts;

    return Scaffold(
      appBar: AppBar(
        title: Text(context.loc.news),
        backgroundColor: colors.surface,
        foregroundColor: colors.text,
        surfaceTintColor: Colors.transparent,
        actions: [
          if (_isRefreshing)
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: colors.primary,
                ),
              ),
            )
          else
            IconButton(
              icon: Icon(Icons.refresh, color: colors.text),
              onPressed: _loadNews,
              tooltip: 'Обновить данные',
            ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _loadNews,
        color: colors.primary,
        child: FutureBuilder<List<NewsModel>>(
          future: _newsListFuture, // Теперь не late
          builder: (context, snapshot) {
            // Добавляем проверку на null
            if (_newsListFuture == null) {
              return Center(
                child: CircularProgressIndicator(color: colors.primary),
              );
            }
            
            if (snapshot.connectionState == ConnectionState.waiting && 
                !_isRefreshing) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(color: colors.primary),
                    const SizedBox(height: 16),
                    Text(
                      _useLocalDataSource ? 
                        'Загрузка из локального хранилища' : 
                        'Загрузка новостей',
                      style: fonts.bodyMedium.copyWith(
                        color: colors.textSecondary,
                      ),
                    ),
                  ],
                ),
              );
            }
            
            if (snapshot.hasError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.error_outline,
                      size: 64,
                      color: colors.error,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Ошибка загрузки новостей',
                      style: fonts.titleMedium.copyWith(
                        color: colors.text,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Используются сохраненные данные',
                      style: fonts.bodyMedium.copyWith(
                        color: colors.textSecondary,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: _loadNews,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: colors.primary,
                        foregroundColor: colors.surface,
                      ),
                      child: const Text('Повторить'),
                    ),
                  ],
                ),
              );
            }
            
            final newsList = snapshot.data ?? [];
            
            if (newsList.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.article,
                      size: 64,
                      color: colors.textSecondary,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Новостей нет',
                      style: fonts.titleMedium.copyWith(
                        color: colors.textSecondary,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Потяните вниз для обновления',
                      style: fonts.bodySmall.copyWith(
                        color: colors.textSecondary,
                      ),
                    ),
                  ],
                ),
              );
            }
            
            return Column(
              children: [
                if (_useLocalDataSource)
                  Container(
                    padding: const EdgeInsets.all(12),
                    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: colors.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: colors.primary.withOpacity(0.3),
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.storage,
                          color: colors.primary,
                          size: 16,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Используются локальные данные',
                          style: TextStyle(
                            fontSize: 12,
                            color: colors.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                Expanded(
                  child: ListView.builder(
                    itemCount: newsList.length,
                    itemBuilder: (context, index) {
                      final news = newsList[index];
                      return Padding(
                        padding: EdgeInsets.fromLTRB(
                          16,
                          index == 0 ? 16 : 8,
                          16,
                          index == newsList.length - 1 ? 16 : 8,
                        ),
                        child: NewsCard(model: news),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}