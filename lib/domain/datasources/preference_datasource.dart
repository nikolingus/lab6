import '../../domain/models/app_theme_mode.dart';

abstract class PreferenceDatasource {
  // Тема
  Future<AppThemeMode?> getThemeMode();
  Future<void> setThemeMode(AppThemeMode mode);
  
  // Токен
  Future<String?> getToken();
  Future<void> setToken(String token);
  Future<void> deleteToken();
  
  // Источник данных
  Future<bool> getUseLocalDataSource();
  Future<void> setUseLocalDataSource(bool value);
  
  // Очистка
  Future<void> clearAll();
}