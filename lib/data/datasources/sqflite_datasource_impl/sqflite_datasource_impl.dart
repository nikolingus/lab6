import 'package:sqflite/sqflite.dart';
import '../../../domain/datasources/db_datasource.dart';
import '../../../domain/models/currency_model.dart';
import '../../../domain/models/news_model.dart';
import './database_helper.dart';
import './table.dart';
import './mappers/currency_model_mapper.dart';
import './mappers/news_model_mapper.dart';

class SqfliteDatasourceImpl implements DbDatasource {
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  @override
  Future<void> init() async {
    await _databaseHelper.database;
  }

  @override
  Future<void> close() async {
    await _databaseHelper.close();
  }

  @override
  Future<List<CurrencyModel>> getCurrencies() async {
    final db = await _databaseHelper.database;
    final List<Map<String, dynamic>> maps = await db.query(
      Table.currencies,
      orderBy: '${CurrenciesTable.name} ASC',
    );
    
    return List.generate(maps.length, (i) {
      return CurrencyModelMapper.fromMap(maps[i]);
    });
  }

  @override
  Future<void> saveCurrencies(List<CurrencyModel> currencies) async {
    final db = await _databaseHelper.database;
    final batch = db.batch();
    
    for (final currency in currencies) {
      batch.insert(
        Table.currencies,
        CurrencyModelMapper.toMap(currency),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
    
    await batch.commit();
  }

  @override
  Future<void> clearCurrencies() async {
    final db = await _databaseHelper.database;
    await db.delete(Table.currencies);
  }

  @override
  Future<List<NewsModel>> getNews() async {
    final db = await _databaseHelper.database;
    final List<Map<String, dynamic>> maps = await db.query(
      Table.news,
      orderBy: '${NewsTable.date} DESC',
    );
    
    return List.generate(maps.length, (i) {
      return NewsModelMapper.fromMap(maps[i]);
    });
  }

  @override
  Future<void> saveNews(List<NewsModel> news) async {
    final db = await _databaseHelper.database;
    final batch = db.batch();
    
    for (final item in news) {
      batch.insert(
        Table.news,
        NewsModelMapper.toMap(item),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
    
    await batch.commit();
  }

  @override
  Future<void> clearNews() async {
    final db = await _databaseHelper.database;
    await db.delete(Table.news);
  }
}