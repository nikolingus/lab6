import 'dart:async';
import '../../domain/datasources/preference_datasource.dart';
import '../../domain/models/app_theme_mode.dart';
import '../../domain/repositories/settings_repository.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  final PreferenceDatasource _preferenceDatasource;
  
  final StreamController<AppThemeMode> _themeModeController = 
      StreamController<AppThemeMode>.broadcast();
  final StreamController<String?> _tokenController = 
      StreamController<String?>.broadcast();
  final StreamController<bool> _isAuthorizedController = 
      StreamController<bool>.broadcast();
  final StreamController<bool> _useLocalDataSourceController = 
      StreamController<bool>.broadcast();
  
  AppThemeMode? _currentThemeMode;
  String? _currentToken;
  bool? _useLocalDataSource;

  SettingsRepositoryImpl(this._preferenceDatasource) {
    _loadInitialValues();
  }

  Future<void> _loadInitialValues() async {
    _currentThemeMode = await _preferenceDatasource.getThemeMode() ?? AppThemeMode.system;
    _currentToken = await _preferenceDatasource.getToken();
    _useLocalDataSource = await _preferenceDatasource.getUseLocalDataSource() ?? false;
    
    _themeModeController.add(_currentThemeMode!);
    _tokenController.add(_currentToken);
    _isAuthorizedController.add(_currentToken != null);
    _useLocalDataSourceController.add(_useLocalDataSource!);
  }

  @override
  Stream<AppThemeMode> get themeModeStream => _themeModeController.stream;

  @override
  AppThemeMode get currentThemeMode => _currentThemeMode ?? AppThemeMode.system;

  @override
  Future<void> setThemeMode(AppThemeMode mode) async {
    await _preferenceDatasource.setThemeMode(mode);
    _currentThemeMode = mode;
    _themeModeController.add(mode);
  }

  @override
  Stream<String?> get tokenStream => _tokenController.stream;

  @override
  String? get currentToken => _currentToken;

  @override
  Future<void> setToken(String? token) async {
    if (token == null) {
      await _preferenceDatasource.deleteToken();
      _currentToken = null;
    } else {
      await _preferenceDatasource.setToken(token);
      _currentToken = token;
    }
    _tokenController.add(_currentToken);
    _isAuthorizedController.add(_currentToken != null);
  }

  @override
  Future<void> clearToken() async {
    await setToken(null);
  }

  @override
  Stream<bool> get isAuthorizedStream => _isAuthorizedController.stream;

  @override
  bool get isAuthorized => _currentToken != null;

  @override
  Stream<bool> get useLocalDataSourceStream => _useLocalDataSourceController.stream;

  @override
  bool get useLocalDataSource => _useLocalDataSource ?? false;

  @override
  Future<void> setUseLocalDataSource(bool value) async {
    await _preferenceDatasource.setUseLocalDataSource(value);
    _useLocalDataSource = value;
    _useLocalDataSourceController.add(value);
  }

  @override
  Future<void> clearAllSettings() async {
    await _preferenceDatasource.clearAll();
    await _loadInitialValues();
  }

  void dispose() {
    _themeModeController.close();
    _tokenController.close();
    _isAuthorizedController.close();
    _useLocalDataSourceController.close();
  }
}