// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'Помогатор';

  @override
  String get login => 'Войти';

  @override
  String get logout => 'Выйти';

  @override
  String get currencyRate => 'Курс Валют';

  @override
  String get news => 'Новости';

  @override
  String get profile => 'Профиль';

  @override
  String get theme => 'Тема';

  @override
  String get light => 'Светлая';

  @override
  String get dark => 'Тёмная';

  @override
  String get system => 'Системная';

  @override
  String get search => 'Поиск';

  @override
  String get searchHint => 'Введите запрос';

  @override
  String get loading => 'Загрузка';

  @override
  String get error => 'Ошибка';

  @override
  String get tryAgain => 'Попробовать снова';

  @override
  String get settings => 'Настройки';

  @override
  String get language => 'Язык';

  @override
  String get russian => 'Русский';

  @override
  String get english => 'Английский';

  @override
  String get spanish => 'Испанский';

  @override
  String get errorPage => 'Ошибка';

  @override
  String get pageNotFound => 'Страница не найдена';

  @override
  String pageNotExist(Object pageName) {
    return 'Страница $pageName не существует';
  }

  @override
  String get goToHome => 'На главную';

  @override
  String get themeSelection => 'Выбор цветовой темы';

  @override
  String get languageSelection => 'Выбор языка приложения';

  @override
  String get notifications => 'Уведомления';

  @override
  String get notificationsSettings => 'Настройка уведомлений';

  @override
  String get aboutApp => 'О приложении';

  @override
  String get close => 'Закрыть';

  @override
  String get aboutAppVersion =>
      'Версия 1.0.0\n\nПриложение для отслеживания курсов валют';

  @override
  String themeSelected(Object theme) {
    return 'Выбрана тема: $theme';
  }

  @override
  String languageSelected(Object language) {
    return 'Выбран язык: $language';
  }

  @override
  String get notificationsSaved => 'Настройки уведомлений сохранены';

  @override
  String get settingsSaved => 'Настройки сохранены успешно!';

  @override
  String get userLoggedOut => 'Пользователь вышел из настроек';

  @override
  String get appearance => 'Внешний вид';

  @override
  String get data => 'Данные';

  @override
  String get useLocalData => 'Использовать локальные данные';

  @override
  String get loadFromCache => 'Загружать данные из кэша при запуске';

  @override
  String get clearCache => 'Очистить кэш';

  @override
  String get deleteAllData => 'Удалить все сохраненные данные';

  @override
  String get dialog => 'Диалог';

  @override
  String get exampleDialog => 'Пример диалога из профиля';

  @override
  String get cancel => 'Отмена';

  @override
  String get ok => 'OK';

  @override
  String get edit => 'Редактировать';

  @override
  String get delete => 'Удалить';

  @override
  String get clearCacheQuestion => 'Очистить кэш?';

  @override
  String get cacheWillBeDeleted =>
      'Все сохраненные данные будут удалены. Это действие нельзя отменить.';

  @override
  String get clear => 'Очистить';

  @override
  String get cacheCleared => 'Кэш успешно очищен';

  @override
  String cacheError(Object error) {
    return 'Ошибка при очистке кэша: $error';
  }

  @override
  String get confirmLogout => 'Вы действительно хотите выйти?';

  @override
  String result(Object result) {
    return 'Результат: $result';
  }

  @override
  String selected(Object selected) {
    return 'Выбрано: $selected';
  }

  @override
  String get cbrRates => 'Курсы валют ЦБ РФ';

  @override
  String get actualRates => 'Актуальные курсы валют и финансовые новости';

  @override
  String get loginToApp => 'Войти в приложение';

  @override
  String get continueWithoutLogin => 'Продолжить без входа';

  @override
  String get save => 'Сохранить';

  @override
  String get name => 'Имя';

  @override
  String get email => 'Email';

  @override
  String get id => 'ID';

  @override
  String get appTheme => 'Тема приложения';

  @override
  String get guest => 'Гость';

  @override
  String get exchangeRates => 'Курсы валют';

  @override
  String get currencies => 'Валюты';

  @override
  String get currenciesTab => 'Валюты';

  @override
  String get newsTab => 'Новости';

  @override
  String get portfolio => 'Портфель';

  @override
  String get portfolioTab => 'Портфель';

  @override
  String get analytics => 'Аналитика';

  @override
  String get analyticsTab => 'Аналитика';

  @override
  String profileUpdated(Object userName) {
    return 'Профиль обновлен: $userName';
  }

  @override
  String get dateFormat => 'dd.MM.yyyy';

  @override
  String get timeFormat => 'HH:mm';

  @override
  String get dateTimeFormat => 'dd.MM.yyyy HH:mm';

  @override
  String get newsDateTimeFormat => 'E HH:mm dd.MM.yy';

  @override
  String get appName => 'Курсы валют ЦБ РФ';

  @override
  String get appThemeTitle => 'Тема приложения';

  @override
  String get lightTheme => 'Светлая';

  @override
  String get darkTheme => 'Тёмная';

  @override
  String get systemTheme => 'Системная';

  @override
  String get noInternet => 'Нет подключения к интернету';

  @override
  String get usingSavedData => 'Используются сохраненные данные';

  @override
  String get retry => 'Повторить попытку';

  @override
  String get loadingFromLocal => 'Загрузка из локального хранилища';

  @override
  String get loadingExchangeRates => 'Загрузка курсов валют';

  @override
  String get searchByNameOrCode => 'Поиск по названию или коду';

  @override
  String get usingLocalData => 'Используются локальные данные';

  @override
  String get nothingFound => 'Ничего не найдено';

  @override
  String get tryDifferentQuery => 'Попробуйте изменить запрос';

  @override
  String get refreshData => 'Обновить данные';

  @override
  String get errorOccurred => 'Произошла ошибка';

  @override
  String dbSaveError(Object error) {
    return 'Ошибка при сохранении в БД: $error';
  }

  @override
  String get nominal => 'Номинал';

  @override
  String nominalCount(Object value) {
    return 'Номинал: $value';
  }

  @override
  String get rubleSymbol => '₽';

  @override
  String get increase => 'рост';

  @override
  String get decrease => 'падение';

  @override
  String get unchanged => 'без изменений';

  @override
  String changeSymbol(Object change) {
    return '$change';
  }

  @override
  String forNominal(Object nominal, Object units) {
    return 'за $nominal $units';
  }

  @override
  String get rateChange => 'Изменение курса';

  @override
  String get currentRate => 'Текущий курс';

  @override
  String get previousRate => 'Предыдущий курс';

  @override
  String get change => 'Изменение';

  @override
  String get changePercent => 'Изменение в %';

  @override
  String get information => 'Информация';

  @override
  String get currencyCode => 'Код валюты';

  @override
  String get analyticsReports => 'Аналитические отчеты';

  @override
  String get analyticsDescription =>
      'В этом разделе представлены графики и аналитика\nпо курсам валют и вашим инвестициям';

  @override
  String get analyticsTrends => 'Тренды';

  @override
  String get analyticsTrendsDescription => 'Анализ трендов';

  @override
  String get analyticsForecasts => 'Прогнозы';

  @override
  String get analyticsForecastsDescription => 'Прогнозы курсов';

  @override
  String get analyticsReportsDescription => 'Детальные отчеты';

  @override
  String get analyticsComparison => 'Сравнение';

  @override
  String get analyticsComparisonDescription => 'Сравнение валют';

  @override
  String get analyticsWeeklyStats => 'Статистика за неделю';

  @override
  String get analyticsTopGainer => 'Самый рост';

  @override
  String get analyticsTopGainerValue => 'USD +2.1%';

  @override
  String get analyticsTopLoser => 'Самый спад';

  @override
  String get analyticsTopLoserValue => 'EUR -1.3%';

  @override
  String get analyticsVolatility => 'Волатильность';

  @override
  String get analyticsVolatilityValue => 'Средняя';

  @override
  String get analyticsSaveButton => 'Сохранить и выйти';

  @override
  String get analyticsSaveMessage => 'Анализ сохранен';

  @override
  String get portfolioTitle => 'Ваш портфель валют';

  @override
  String get portfolioDescription =>
      'В этом разделе будет отображаться информация\nо ваших валютных активах и инвестициях';

  @override
  String get portfolioBackButton => 'Вернуться назад';

  @override
  String get portfolioViewedMessage => 'Портфель просмотрен';

  @override
  String get portfolioMonthlyReturn => 'Доходность за месяц:';

  @override
  String get portfolioMonthlyReturnValue => '+5.2%';

  @override
  String get portfolioTotalValue => 'Общая стоимость:';

  @override
  String get portfolioTotalValueAmount => '125 430 ₽';

  @override
  String get symbol => 'Символ';

  @override
  String get unit => 'единица';

  @override
  String get unitsFew => 'единицы';

  @override
  String get unitsMany => 'единиц';

  @override
  String units(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# единиц',
      many: '# единиц',
      few: '# единицы',
      one: '# единица',
    );
    return '$_temp0';
  }

  @override
  String unitsWithCount(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'единиц',
      many: 'единиц',
      few: 'единицы',
      one: 'единица',
    );
    return '$count $_temp0';
  }

  @override
  String nominalWithUnits(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# единиц',
      many: '# единиц',
      few: '# единицы',
      one: '# единица',
    );
    return '$_temp0';
  }

  @override
  String currencyUnits(num count, Object currency) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# единиц',
      many: '# единиц',
      few: '# единицы',
      one: '# единица',
    );
    return '$_temp0 $currency';
  }
}
