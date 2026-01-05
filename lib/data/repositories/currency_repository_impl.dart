import '../../domain/datasources/rest_datasource.dart';
import '../../domain/datasources/db_datasource.dart';
import '../../domain/models/currency_model.dart';
import '../../domain/repositories/currency_repository.dart';

class CurrencyRepositoryImpl implements CurrencyRepository {
  final RestDatasource _restDatasource;
  final DbDatasource? _dbDatasource;
  final bool _useLocalDataSource;

  CurrencyRepositoryImpl(
    this._restDatasource, {
    DbDatasource? dbDatasource,
    bool useLocalDataSource = false,
  }) : _dbDatasource = dbDatasource,
       _useLocalDataSource = useLocalDataSource;

  @override
  Future<List<CurrencyModel>> getCurrencies() async {
    try {
      // Если используем локальные данные и есть доступ к БД
      if (_useLocalDataSource && _dbDatasource != null) {
        final localCurrencies = await _dbDatasource!.getCurrencies();
        if (localCurrencies.isNotEmpty) {
          // Асинхронно обновляем из сети
          _updateFromNetwork();
          return localCurrencies;
        }
      }
      
      // Получаем данные из сети
      final currencies = await _restDatasource.fetchCurrencies();
      
      // Сохраняем в локальную БД если она доступна
      if (_dbDatasource != null) {
        await _dbDatasource!.saveCurrencies(currencies);
      }
      
      return currencies;
    } catch (e) {
      // Если ошибка сети, пробуем получить из локальной БД
      if (_dbDatasource != null) {
        final localCurrencies = await _dbDatasource!.getCurrencies();
        if (localCurrencies.isNotEmpty) {
          return localCurrencies;
        }
      }
      rethrow;
    }
  }

  @override
  Future<CurrencyModel> getCurrencyDetail(String id) async {
    // Сначала пробуем найти в локальной БД
    if (_useLocalDataSource && _dbDatasource != null) {
      final localCurrencies = await _dbDatasource!.getCurrencies();
      final localCurrency = localCurrencies.firstWhere(
        (c) => c.id == id,
        orElse: () => CurrencyModel(
          id: '',
          nominal: 0,
          name: '',
          symbol: '',
          value: 0.0,
          previousValue: 0.0,
        ),
      );
      
      if (localCurrency.id.isNotEmpty) {
        return localCurrency;
      }
    }
    
    // Если не нашли локально, загружаем из сети
    final currencies = await _restDatasource.fetchCurrencies();
    final currency = currencies.firstWhere(
      (c) => c.id == id,
      orElse: () => throw Exception('Currency not found: $id'),
    );
    return currency;
  }

  @override
  Future<List<CurrencyModel>> getFavoriteCurrencies() async {
    if (_dbDatasource != null) {
      final allCurrencies = await _dbDatasource!.getCurrencies();
      
      return allCurrencies.take(3).toList();
    }
    
    final currencies = await _restDatasource.fetchCurrencies();
    return currencies.take(3).toList();
  }

  @override
  Future<void> toggleFavorite(String currencyId) async {
    if (_dbDatasource != null) {
      
      print('Toggle favorite in DB: $currencyId');
    } else {
      print('Toggle favorite: $currencyId');
    }
  }

  @override
  Future<void> saveCurrencyList(List<CurrencyModel> currencies) async {
    if (_dbDatasource != null) {
      await _dbDatasource!.saveCurrencies(currencies);
    } else {
      throw Exception('Local database is not available');
    }
  }

  Future<void> _updateFromNetwork() async {
    try {
      final currencies = await _restDatasource.fetchCurrencies();
      if (_dbDatasource != null) {
        await _dbDatasource!.saveCurrencies(currencies);
      }
    } catch (e) {
      // Игнорируем ошибки при фоновом обновлении
      print('Background update failed: $e');
    }
  }
}