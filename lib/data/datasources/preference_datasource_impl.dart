import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../domain/datasources/preference_datasource.dart';
import '../../domain/models/app_theme_mode.dart';

class AppPreferencesDatasourceImpl implements PreferenceDatasource {
  static const String _themeModeKey = 'theme_mode';
  static const String _tokenKey = 'auth_token';
  static const String _useLocalDataSourceKey = 'use_local_data_source';
  
  final SharedPreferences _prefs;
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  AppPreferencesDatasourceImpl(this._prefs);

  @override
  Future<AppThemeMode?> getThemeMode() async {
    final value = _prefs.getString(_themeModeKey);
    if (value == null) return null;
    
    try {
      return AppThemeMode.values.byName(value);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> setThemeMode(AppThemeMode mode) async {
    await _prefs.setString(_themeModeKey, mode.name);
  }

  @override
  Future<String?> getToken() async {
    return await _secureStorage.read(key: _tokenKey);
  }

  @override
  Future<void> setToken(String token) async {
    await _secureStorage.write(key: _tokenKey, value: token);
  }

  @override
  Future<void> deleteToken() async {
    await _secureStorage.delete(key: _tokenKey);
  }

  @override
  Future<bool> getUseLocalDataSource() async {
    return _prefs.getBool(_useLocalDataSourceKey) ?? false;
  }

  @override
  Future<void> setUseLocalDataSource(bool value) async {
    await _prefs.setBool(_useLocalDataSourceKey, value);
  }

  @override
  Future<void> clearAll() async {
    await _prefs.clear();
    await _secureStorage.deleteAll();
  }
}