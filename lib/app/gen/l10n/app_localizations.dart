import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_ru.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es'),
    Locale('ru')
  ];

  /// Название приложения
  ///
  /// In ru, this message translates to:
  /// **'Помогатор'**
  String get appTitle;

  /// No description provided for @login.
  ///
  /// In ru, this message translates to:
  /// **'Войти'**
  String get login;

  /// No description provided for @logout.
  ///
  /// In ru, this message translates to:
  /// **'Выйти'**
  String get logout;

  /// No description provided for @currencyRate.
  ///
  /// In ru, this message translates to:
  /// **'Курс Валют'**
  String get currencyRate;

  /// No description provided for @news.
  ///
  /// In ru, this message translates to:
  /// **'Новости'**
  String get news;

  /// No description provided for @profile.
  ///
  /// In ru, this message translates to:
  /// **'Профиль'**
  String get profile;

  /// No description provided for @theme.
  ///
  /// In ru, this message translates to:
  /// **'Тема'**
  String get theme;

  /// No description provided for @light.
  ///
  /// In ru, this message translates to:
  /// **'Светлая'**
  String get light;

  /// No description provided for @dark.
  ///
  /// In ru, this message translates to:
  /// **'Тёмная'**
  String get dark;

  /// No description provided for @system.
  ///
  /// In ru, this message translates to:
  /// **'Системная'**
  String get system;

  /// No description provided for @search.
  ///
  /// In ru, this message translates to:
  /// **'Поиск'**
  String get search;

  /// No description provided for @searchHint.
  ///
  /// In ru, this message translates to:
  /// **'Введите запрос'**
  String get searchHint;

  /// No description provided for @loading.
  ///
  /// In ru, this message translates to:
  /// **'Загрузка'**
  String get loading;

  /// No description provided for @error.
  ///
  /// In ru, this message translates to:
  /// **'Ошибка'**
  String get error;

  /// No description provided for @tryAgain.
  ///
  /// In ru, this message translates to:
  /// **'Попробовать снова'**
  String get tryAgain;

  /// No description provided for @settings.
  ///
  /// In ru, this message translates to:
  /// **'Настройки'**
  String get settings;

  /// No description provided for @language.
  ///
  /// In ru, this message translates to:
  /// **'Язык'**
  String get language;

  /// No description provided for @russian.
  ///
  /// In ru, this message translates to:
  /// **'Русский'**
  String get russian;

  /// No description provided for @english.
  ///
  /// In ru, this message translates to:
  /// **'Английский'**
  String get english;

  /// No description provided for @spanish.
  ///
  /// In ru, this message translates to:
  /// **'Испанский'**
  String get spanish;

  /// No description provided for @errorPage.
  ///
  /// In ru, this message translates to:
  /// **'Ошибка'**
  String get errorPage;

  /// No description provided for @pageNotFound.
  ///
  /// In ru, this message translates to:
  /// **'Страница не найдена'**
  String get pageNotFound;

  /// No description provided for @pageNotExist.
  ///
  /// In ru, this message translates to:
  /// **'Страница {pageName} не существует'**
  String pageNotExist(Object pageName);

  /// No description provided for @goToHome.
  ///
  /// In ru, this message translates to:
  /// **'На главную'**
  String get goToHome;

  /// No description provided for @themeSelection.
  ///
  /// In ru, this message translates to:
  /// **'Выбор цветовой темы'**
  String get themeSelection;

  /// No description provided for @languageSelection.
  ///
  /// In ru, this message translates to:
  /// **'Выбор языка приложения'**
  String get languageSelection;

  /// No description provided for @notifications.
  ///
  /// In ru, this message translates to:
  /// **'Уведомления'**
  String get notifications;

  /// No description provided for @notificationsSettings.
  ///
  /// In ru, this message translates to:
  /// **'Настройка уведомлений'**
  String get notificationsSettings;

  /// No description provided for @aboutApp.
  ///
  /// In ru, this message translates to:
  /// **'О приложении'**
  String get aboutApp;

  /// No description provided for @close.
  ///
  /// In ru, this message translates to:
  /// **'Закрыть'**
  String get close;

  /// No description provided for @aboutAppVersion.
  ///
  /// In ru, this message translates to:
  /// **'Версия 1.0.0\n\nПриложение для отслеживания курсов валют'**
  String get aboutAppVersion;

  /// No description provided for @themeSelected.
  ///
  /// In ru, this message translates to:
  /// **'Выбрана тема: {theme}'**
  String themeSelected(Object theme);

  /// No description provided for @languageSelected.
  ///
  /// In ru, this message translates to:
  /// **'Выбран язык: {language}'**
  String languageSelected(Object language);

  /// No description provided for @notificationsSaved.
  ///
  /// In ru, this message translates to:
  /// **'Настройки уведомлений сохранены'**
  String get notificationsSaved;

  /// No description provided for @settingsSaved.
  ///
  /// In ru, this message translates to:
  /// **'Настройки сохранены успешно!'**
  String get settingsSaved;

  /// No description provided for @userLoggedOut.
  ///
  /// In ru, this message translates to:
  /// **'Пользователь вышел из настроек'**
  String get userLoggedOut;

  /// No description provided for @appearance.
  ///
  /// In ru, this message translates to:
  /// **'Внешний вид'**
  String get appearance;

  /// No description provided for @data.
  ///
  /// In ru, this message translates to:
  /// **'Данные'**
  String get data;

  /// No description provided for @useLocalData.
  ///
  /// In ru, this message translates to:
  /// **'Использовать локальные данные'**
  String get useLocalData;

  /// No description provided for @loadFromCache.
  ///
  /// In ru, this message translates to:
  /// **'Загружать данные из кэша при запуске'**
  String get loadFromCache;

  /// No description provided for @clearCache.
  ///
  /// In ru, this message translates to:
  /// **'Очистить кэш'**
  String get clearCache;

  /// No description provided for @deleteAllData.
  ///
  /// In ru, this message translates to:
  /// **'Удалить все сохраненные данные'**
  String get deleteAllData;

  /// No description provided for @dialog.
  ///
  /// In ru, this message translates to:
  /// **'Диалог'**
  String get dialog;

  /// No description provided for @exampleDialog.
  ///
  /// In ru, this message translates to:
  /// **'Пример диалога из профиля'**
  String get exampleDialog;

  /// No description provided for @cancel.
  ///
  /// In ru, this message translates to:
  /// **'Отмена'**
  String get cancel;

  /// No description provided for @ok.
  ///
  /// In ru, this message translates to:
  /// **'OK'**
  String get ok;

  /// No description provided for @edit.
  ///
  /// In ru, this message translates to:
  /// **'Редактировать'**
  String get edit;

  /// No description provided for @delete.
  ///
  /// In ru, this message translates to:
  /// **'Удалить'**
  String get delete;

  /// No description provided for @clearCacheQuestion.
  ///
  /// In ru, this message translates to:
  /// **'Очистить кэш?'**
  String get clearCacheQuestion;

  /// No description provided for @cacheWillBeDeleted.
  ///
  /// In ru, this message translates to:
  /// **'Все сохраненные данные будут удалены. Это действие нельзя отменить.'**
  String get cacheWillBeDeleted;

  /// No description provided for @clear.
  ///
  /// In ru, this message translates to:
  /// **'Очистить'**
  String get clear;

  /// No description provided for @cacheCleared.
  ///
  /// In ru, this message translates to:
  /// **'Кэш успешно очищен'**
  String get cacheCleared;

  /// No description provided for @cacheError.
  ///
  /// In ru, this message translates to:
  /// **'Ошибка при очистке кэша: {error}'**
  String cacheError(Object error);

  /// No description provided for @confirmLogout.
  ///
  /// In ru, this message translates to:
  /// **'Вы действительно хотите выйти?'**
  String get confirmLogout;

  /// No description provided for @result.
  ///
  /// In ru, this message translates to:
  /// **'Результат: {result}'**
  String result(Object result);

  /// No description provided for @selected.
  ///
  /// In ru, this message translates to:
  /// **'Выбрано: {selected}'**
  String selected(Object selected);

  /// No description provided for @cbrRates.
  ///
  /// In ru, this message translates to:
  /// **'Курсы валют ЦБ РФ'**
  String get cbrRates;

  /// No description provided for @actualRates.
  ///
  /// In ru, this message translates to:
  /// **'Актуальные курсы валют и финансовые новости'**
  String get actualRates;

  /// No description provided for @loginToApp.
  ///
  /// In ru, this message translates to:
  /// **'Войти в приложение'**
  String get loginToApp;

  /// No description provided for @continueWithoutLogin.
  ///
  /// In ru, this message translates to:
  /// **'Продолжить без входа'**
  String get continueWithoutLogin;

  /// No description provided for @save.
  ///
  /// In ru, this message translates to:
  /// **'Сохранить'**
  String get save;

  /// No description provided for @name.
  ///
  /// In ru, this message translates to:
  /// **'Имя'**
  String get name;

  /// No description provided for @email.
  ///
  /// In ru, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @id.
  ///
  /// In ru, this message translates to:
  /// **'ID'**
  String get id;

  /// No description provided for @appTheme.
  ///
  /// In ru, this message translates to:
  /// **'Тема приложения'**
  String get appTheme;

  /// No description provided for @guest.
  ///
  /// In ru, this message translates to:
  /// **'Гость'**
  String get guest;

  /// No description provided for @exchangeRates.
  ///
  /// In ru, this message translates to:
  /// **'Курсы валют'**
  String get exchangeRates;

  /// No description provided for @currencies.
  ///
  /// In ru, this message translates to:
  /// **'Валюты'**
  String get currencies;

  /// No description provided for @currenciesTab.
  ///
  /// In ru, this message translates to:
  /// **'Валюты'**
  String get currenciesTab;

  /// No description provided for @newsTab.
  ///
  /// In ru, this message translates to:
  /// **'Новости'**
  String get newsTab;

  /// No description provided for @portfolio.
  ///
  /// In ru, this message translates to:
  /// **'Портфель'**
  String get portfolio;

  /// No description provided for @portfolioTab.
  ///
  /// In ru, this message translates to:
  /// **'Портфель'**
  String get portfolioTab;

  /// No description provided for @analytics.
  ///
  /// In ru, this message translates to:
  /// **'Аналитика'**
  String get analytics;

  /// No description provided for @analyticsTab.
  ///
  /// In ru, this message translates to:
  /// **'Аналитика'**
  String get analyticsTab;

  /// No description provided for @profileUpdated.
  ///
  /// In ru, this message translates to:
  /// **'Профиль обновлен: {userName}'**
  String profileUpdated(Object userName);

  /// No description provided for @dateFormat.
  ///
  /// In ru, this message translates to:
  /// **'dd.MM.yyyy'**
  String get dateFormat;

  /// No description provided for @timeFormat.
  ///
  /// In ru, this message translates to:
  /// **'HH:mm'**
  String get timeFormat;

  /// No description provided for @dateTimeFormat.
  ///
  /// In ru, this message translates to:
  /// **'dd.MM.yyyy HH:mm'**
  String get dateTimeFormat;

  /// No description provided for @newsDateTimeFormat.
  ///
  /// In ru, this message translates to:
  /// **'E HH:mm dd.MM.yy'**
  String get newsDateTimeFormat;

  /// No description provided for @appName.
  ///
  /// In ru, this message translates to:
  /// **'Курсы валют ЦБ РФ'**
  String get appName;

  /// No description provided for @appThemeTitle.
  ///
  /// In ru, this message translates to:
  /// **'Тема приложения'**
  String get appThemeTitle;

  /// No description provided for @lightTheme.
  ///
  /// In ru, this message translates to:
  /// **'Светлая'**
  String get lightTheme;

  /// No description provided for @darkTheme.
  ///
  /// In ru, this message translates to:
  /// **'Тёмная'**
  String get darkTheme;

  /// No description provided for @systemTheme.
  ///
  /// In ru, this message translates to:
  /// **'Системная'**
  String get systemTheme;

  /// No description provided for @noInternet.
  ///
  /// In ru, this message translates to:
  /// **'Нет подключения к интернету'**
  String get noInternet;

  /// No description provided for @usingSavedData.
  ///
  /// In ru, this message translates to:
  /// **'Используются сохраненные данные'**
  String get usingSavedData;

  /// No description provided for @retry.
  ///
  /// In ru, this message translates to:
  /// **'Повторить попытку'**
  String get retry;

  /// No description provided for @loadingFromLocal.
  ///
  /// In ru, this message translates to:
  /// **'Загрузка из локального хранилища'**
  String get loadingFromLocal;

  /// No description provided for @loadingExchangeRates.
  ///
  /// In ru, this message translates to:
  /// **'Загрузка курсов валют'**
  String get loadingExchangeRates;

  /// No description provided for @searchByNameOrCode.
  ///
  /// In ru, this message translates to:
  /// **'Поиск по названию или коду'**
  String get searchByNameOrCode;

  /// No description provided for @usingLocalData.
  ///
  /// In ru, this message translates to:
  /// **'Используются локальные данные'**
  String get usingLocalData;

  /// No description provided for @nothingFound.
  ///
  /// In ru, this message translates to:
  /// **'Ничего не найдено'**
  String get nothingFound;

  /// No description provided for @tryDifferentQuery.
  ///
  /// In ru, this message translates to:
  /// **'Попробуйте изменить запрос'**
  String get tryDifferentQuery;

  /// No description provided for @refreshData.
  ///
  /// In ru, this message translates to:
  /// **'Обновить данные'**
  String get refreshData;

  /// No description provided for @errorOccurred.
  ///
  /// In ru, this message translates to:
  /// **'Произошла ошибка'**
  String get errorOccurred;

  /// No description provided for @dbSaveError.
  ///
  /// In ru, this message translates to:
  /// **'Ошибка при сохранении в БД: {error}'**
  String dbSaveError(Object error);

  /// No description provided for @nominal.
  ///
  /// In ru, this message translates to:
  /// **'Номинал'**
  String get nominal;

  /// No description provided for @nominalCount.
  ///
  /// In ru, this message translates to:
  /// **'Номинал: {value}'**
  String nominalCount(Object value);

  /// No description provided for @rubleSymbol.
  ///
  /// In ru, this message translates to:
  /// **'₽'**
  String get rubleSymbol;

  /// No description provided for @increase.
  ///
  /// In ru, this message translates to:
  /// **'рост'**
  String get increase;

  /// No description provided for @decrease.
  ///
  /// In ru, this message translates to:
  /// **'падение'**
  String get decrease;

  /// No description provided for @unchanged.
  ///
  /// In ru, this message translates to:
  /// **'без изменений'**
  String get unchanged;

  /// No description provided for @changeSymbol.
  ///
  /// In ru, this message translates to:
  /// **'{change}'**
  String changeSymbol(Object change);

  /// No description provided for @forNominal.
  ///
  /// In ru, this message translates to:
  /// **'за {nominal} {units}'**
  String forNominal(Object nominal, Object units);

  /// No description provided for @rateChange.
  ///
  /// In ru, this message translates to:
  /// **'Изменение курса'**
  String get rateChange;

  /// No description provided for @currentRate.
  ///
  /// In ru, this message translates to:
  /// **'Текущий курс'**
  String get currentRate;

  /// No description provided for @previousRate.
  ///
  /// In ru, this message translates to:
  /// **'Предыдущий курс'**
  String get previousRate;

  /// No description provided for @change.
  ///
  /// In ru, this message translates to:
  /// **'Изменение'**
  String get change;

  /// No description provided for @changePercent.
  ///
  /// In ru, this message translates to:
  /// **'Изменение в %'**
  String get changePercent;

  /// No description provided for @information.
  ///
  /// In ru, this message translates to:
  /// **'Информация'**
  String get information;

  /// No description provided for @currencyCode.
  ///
  /// In ru, this message translates to:
  /// **'Код валюты'**
  String get currencyCode;

  /// No description provided for @analyticsReports.
  ///
  /// In ru, this message translates to:
  /// **'Аналитические отчеты'**
  String get analyticsReports;

  /// No description provided for @analyticsDescription.
  ///
  /// In ru, this message translates to:
  /// **'В этом разделе представлены графики и аналитика\nпо курсам валют и вашим инвестициям'**
  String get analyticsDescription;

  /// No description provided for @analyticsTrends.
  ///
  /// In ru, this message translates to:
  /// **'Тренды'**
  String get analyticsTrends;

  /// No description provided for @analyticsTrendsDescription.
  ///
  /// In ru, this message translates to:
  /// **'Анализ трендов'**
  String get analyticsTrendsDescription;

  /// No description provided for @analyticsForecasts.
  ///
  /// In ru, this message translates to:
  /// **'Прогнозы'**
  String get analyticsForecasts;

  /// No description provided for @analyticsForecastsDescription.
  ///
  /// In ru, this message translates to:
  /// **'Прогнозы курсов'**
  String get analyticsForecastsDescription;

  /// No description provided for @analyticsReportsDescription.
  ///
  /// In ru, this message translates to:
  /// **'Детальные отчеты'**
  String get analyticsReportsDescription;

  /// No description provided for @analyticsComparison.
  ///
  /// In ru, this message translates to:
  /// **'Сравнение'**
  String get analyticsComparison;

  /// No description provided for @analyticsComparisonDescription.
  ///
  /// In ru, this message translates to:
  /// **'Сравнение валют'**
  String get analyticsComparisonDescription;

  /// No description provided for @analyticsWeeklyStats.
  ///
  /// In ru, this message translates to:
  /// **'Статистика за неделю'**
  String get analyticsWeeklyStats;

  /// No description provided for @analyticsTopGainer.
  ///
  /// In ru, this message translates to:
  /// **'Самый рост'**
  String get analyticsTopGainer;

  /// No description provided for @analyticsTopGainerValue.
  ///
  /// In ru, this message translates to:
  /// **'USD +2.1%'**
  String get analyticsTopGainerValue;

  /// No description provided for @analyticsTopLoser.
  ///
  /// In ru, this message translates to:
  /// **'Самый спад'**
  String get analyticsTopLoser;

  /// No description provided for @analyticsTopLoserValue.
  ///
  /// In ru, this message translates to:
  /// **'EUR -1.3%'**
  String get analyticsTopLoserValue;

  /// No description provided for @analyticsVolatility.
  ///
  /// In ru, this message translates to:
  /// **'Волатильность'**
  String get analyticsVolatility;

  /// No description provided for @analyticsVolatilityValue.
  ///
  /// In ru, this message translates to:
  /// **'Средняя'**
  String get analyticsVolatilityValue;

  /// No description provided for @analyticsSaveButton.
  ///
  /// In ru, this message translates to:
  /// **'Сохранить и выйти'**
  String get analyticsSaveButton;

  /// No description provided for @analyticsSaveMessage.
  ///
  /// In ru, this message translates to:
  /// **'Анализ сохранен'**
  String get analyticsSaveMessage;

  /// No description provided for @portfolioTitle.
  ///
  /// In ru, this message translates to:
  /// **'Ваш портфель валют'**
  String get portfolioTitle;

  /// No description provided for @portfolioDescription.
  ///
  /// In ru, this message translates to:
  /// **'В этом разделе будет отображаться информация\nо ваших валютных активах и инвестициях'**
  String get portfolioDescription;

  /// No description provided for @portfolioBackButton.
  ///
  /// In ru, this message translates to:
  /// **'Вернуться назад'**
  String get portfolioBackButton;

  /// No description provided for @portfolioViewedMessage.
  ///
  /// In ru, this message translates to:
  /// **'Портфель просмотрен'**
  String get portfolioViewedMessage;

  /// No description provided for @portfolioMonthlyReturn.
  ///
  /// In ru, this message translates to:
  /// **'Доходность за месяц:'**
  String get portfolioMonthlyReturn;

  /// No description provided for @portfolioMonthlyReturnValue.
  ///
  /// In ru, this message translates to:
  /// **'+5.2%'**
  String get portfolioMonthlyReturnValue;

  /// No description provided for @portfolioTotalValue.
  ///
  /// In ru, this message translates to:
  /// **'Общая стоимость:'**
  String get portfolioTotalValue;

  /// No description provided for @portfolioTotalValueAmount.
  ///
  /// In ru, this message translates to:
  /// **'125 430 ₽'**
  String get portfolioTotalValueAmount;

  /// No description provided for @symbol.
  ///
  /// In ru, this message translates to:
  /// **'Символ'**
  String get symbol;

  /// No description provided for @unit.
  ///
  /// In ru, this message translates to:
  /// **'единица'**
  String get unit;

  /// No description provided for @unitsFew.
  ///
  /// In ru, this message translates to:
  /// **'единицы'**
  String get unitsFew;

  /// No description provided for @unitsMany.
  ///
  /// In ru, this message translates to:
  /// **'единиц'**
  String get unitsMany;

  /// Plural form for units
  ///
  /// In ru, this message translates to:
  /// **'{count, plural, one{# единица} few{# единицы} many{# единиц} other{# единиц}}'**
  String units(num count);

  /// Count with units
  ///
  /// In ru, this message translates to:
  /// **'{count} {count, plural, one{единица} few{единицы} many{единиц} other{единиц}}'**
  String unitsWithCount(num count);

  /// Nominal value with plural units
  ///
  /// In ru, this message translates to:
  /// **'{count, plural, one{# единица} few{# единицы} many{# единиц} other{# единиц}}'**
  String nominalWithUnits(num count);

  /// Currency units with count
  ///
  /// In ru, this message translates to:
  /// **'{count, plural, one{# единица} few{# единицы} many{# единиц} other{# единиц}} {currency}'**
  String currencyUnits(num count, Object currency);
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'es', 'ru'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'ru':
      return AppLocalizationsRu();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
