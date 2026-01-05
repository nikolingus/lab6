import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:dart_lab1/app/gen/l10n/l10n.dart';

import 'domain/index.dart';
import 'data/index.dart';
import 'app/index.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await initializeDateFormatting('ru_RU', null);
  
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late Future<void> _initFuture;
  late RestDatasource _restDatasource;
  late SharedPreferences _prefs;
  late FlutterSecureStorage _secureStorage;
  late PreferenceDatasource _preferenceDatasource;
  late DbDatasource _dbDatasource;
  late SettingsRepository _settingsRepository;

  Future<void> _initApp() async {
    _prefs = await SharedPreferences.getInstance();
    _secureStorage = const FlutterSecureStorage();
    
    _preferenceDatasource = _TemporaryPreferenceDatasource(_prefs, _secureStorage);
    
    final dbDs = SqfliteDatasourceImpl();
    await dbDs.init();
    _dbDatasource = dbDs;
    
    _restDatasource = RestDatasourceImpl();
    
    final settingsRepo = SettingsRepositoryImpl(_preferenceDatasource);
    _settingsRepository = settingsRepo;
    
    await Future.delayed(const Duration(seconds: 1));
  }

  @override
  void initState() {
    super.initState();
    _initFuture = _initApp();
  }

  @override
  void dispose() {
    _dbDatasource.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: const SplashPage(),
          );
        }

        return MultiProvider(
          providers: [
            ChangeNotifierProvider<BottomNavVisibility>(
              create: (_) => BottomNavVisibility(),
            ),
            ChangeNotifierProvider<HomeState>(
              create: (_) => HomeState(),
            ),
            Provider<RestDatasource>(
              create: (_) => _restDatasource,
            ),
            Provider<PreferenceDatasource>(
              create: (_) => _preferenceDatasource,
            ),
            Provider<DbDatasource>(
              create: (_) => _dbDatasource,
            ),
            Provider<SettingsRepository>(
              create: (_) => _settingsRepository,
            ),
            ProxyProvider2<SettingsRepository, RestDatasource, CurrencyRepository>(
              update: (context, settingsRepo, restDatasource, _) {
                return CurrencyRepositoryImpl(
                  restDatasource,
                  dbDatasource: _dbDatasource,
                  useLocalDataSource: settingsRepo.useLocalDataSource,
                );
              },
            ),
            ProxyProvider2<SettingsRepository, RestDatasource, NewsRepository>(
              update: (context, settingsRepo, restDatasource, _) {
                return NewsRepositoryImpl(
                  restDatasource,
                  dbDatasource: _dbDatasource,
                  useLocalDataSource: settingsRepo.useLocalDataSource,
                );
              },
            ),
          ],
          child: Consumer<SettingsRepository>(
            builder: (context, settingsRepo, child) {
              return StreamBuilder<AppThemeMode>(
                stream: settingsRepo.themeModeStream,
                initialData: settingsRepo.currentThemeMode,
                builder: (context, snapshot) {
                  final themeMode = snapshot.data ?? AppThemeMode.system;
                  
                  return MaterialApp(
                    debugShowCheckedModeBanner: false,
                    title: 'Помогатор', 
                    locale: const Locale('es'), // локаль
                    localizationsDelegates: const [
                      AppLocalizations.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                    ],
                    supportedLocales: const [
                      Locale('en'),
                      Locale('ru'),
                      Locale('es'),
                    ],
                    theme: AppThemeData.light().toMaterialTheme(),
                    darkTheme: AppThemeData.dark().toMaterialTheme(),
                    themeMode: themeMode.toThemeMode(),
                    routes: {
                      AppRoutes.currencyList: (context) => const CurrencyListPage(),
                      AppRoutes.newsList: (context) => const NewsListPage(),
                      AppRoutes.profile: (context) => const ProfilePage(),
                      AppRoutes.portfolio: (context) => const PortfolioPage(),
                      AppRoutes.analytics: (context) => const AnalyticsPage(),
                      AppRoutes.login: (context) => const LoginPage(),
                    },
                    onGenerateRoute: (settings) {
                      if (settings.name == AppRoutes.currencyDetail) {
                        final args = settings.arguments;
                        if (args != null && args is Map<String, dynamic>) {
                          return MaterialPageRoute(
                            builder: (context) => CurrencyDetailPage(arguments: args),
                          );
                        }
                      }
                      return null;
                    },
                    onUnknownRoute: (settings) {
                      return MaterialPageRoute(
                        builder: (context) => Scaffold(
                          appBar: AppBar(title: const Text('Ошибка')),
                          body: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.error_outline,
                                  size: 64,
                                  color: Colors.red,
                                ),
                                const SizedBox(height: 16),
                                const Text(
                                  'Страница не найдена',
                                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Страница ${settings.name} не существует',
                                  style: const TextStyle(fontSize: 16),
                                ),
                                const SizedBox(height: 24),
                                ElevatedButton(
                                  onPressed: () => Navigator.pushReplacementNamed(
                                    context,
                                    AppRoutes.home,
                                  ),
                                  child: const Text('На главную'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    home: StreamBuilder<bool>(
                      stream: settingsRepo.isAuthorizedStream,
                      initialData: settingsRepo.isAuthorized,
                      builder: (context, snapshot) {
                        final isAuthorized = snapshot.data ?? false;
                        
                        if (!isAuthorized) {
                          return const LoginPage();
                        }
                        
                        return const HomePage();
                      },
                    ),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}

class _TemporaryPreferenceDatasource implements PreferenceDatasource {
  final SharedPreferences _prefs;
  final FlutterSecureStorage _secureStorage;

  _TemporaryPreferenceDatasource(this._prefs, this._secureStorage);

  @override
  Future<AppThemeMode?> getThemeMode() async {
    final value = _prefs.getString('theme_mode');
    if (value == null) return null;
    
    try {
      return AppThemeMode.values.firstWhere((e) => e.name == value);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> setThemeMode(AppThemeMode mode) async {
    await _prefs.setString('theme_mode', mode.name);
  }

  @override
  Future<String?> getToken() async {
    return await _secureStorage.read(key: 'auth_token');
  }

  @override
  Future<void> setToken(String token) async {
    await _secureStorage.write(key: 'auth_token', value: token);
  }

  @override
  Future<void> deleteToken() async {
    await _secureStorage.delete(key: 'auth_token');
  }

  @override
  Future<bool> getUseLocalDataSource() async {
    return _prefs.getBool('use_local_data_source') ?? false;
  }

  @override
  Future<void> setUseLocalDataSource(bool value) async {
    await _prefs.setBool('use_local_data_source', value);
  }

  @override
  Future<void> clearAll() async {
    await _prefs.clear();
    await _secureStorage.deleteAll();
  }
}