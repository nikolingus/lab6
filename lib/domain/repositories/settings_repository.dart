import '../models/app_theme_mode.dart';

abstract class SettingsRepository {
  // Тема приложения
  Stream<AppThemeMode> get themeModeStream;
  AppThemeMode get currentThemeMode;
  Future<void> setThemeMode(AppThemeMode mode);
  
  // Токен авторизации
  Stream<String?> get tokenStream;
  String? get currentToken;
  Future<void> setToken(String? token);
  Future<void> clearToken();
  
  // Статус авторизации
  Stream<bool> get isAuthorizedStream;
  bool get isAuthorized;
  
  // Настройки источника данных
  Stream<bool> get useLocalDataSourceStream;
  bool get useLocalDataSource;
  Future<void> setUseLocalDataSource(bool value);
  
  // Очистка всех настроек
  Future<void> clearAllSettings();
}