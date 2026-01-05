// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Helper';

  @override
  String get login => 'Login';

  @override
  String get logout => 'Logout';

  @override
  String get currencyRate => 'Exchange Rate';

  @override
  String get news => 'News';

  @override
  String get profile => 'Profile';

  @override
  String get theme => 'Theme';

  @override
  String get light => 'Light';

  @override
  String get dark => 'Dark';

  @override
  String get system => 'System';

  @override
  String get search => 'Search';

  @override
  String get searchHint => 'Enter query';

  @override
  String get loading => 'Loading';

  @override
  String get error => 'Error';

  @override
  String get tryAgain => 'Try again';

  @override
  String get settings => 'Settings';

  @override
  String get language => 'Language';

  @override
  String get russian => 'Russian';

  @override
  String get english => 'English';

  @override
  String get spanish => 'Spanish';

  @override
  String get errorPage => 'Error';

  @override
  String get pageNotFound => 'Page not found';

  @override
  String pageNotExist(Object pageName) {
    return 'Page $pageName does not exist';
  }

  @override
  String get goToHome => 'Go to home';

  @override
  String get themeSelection => 'Color theme selection';

  @override
  String get languageSelection => 'App language selection';

  @override
  String get notifications => 'Notifications';

  @override
  String get notificationsSettings => 'Notification settings';

  @override
  String get aboutApp => 'About app';

  @override
  String get close => 'Close';

  @override
  String get aboutAppVersion =>
      'Version 1.0.0\n\nCurrency tracking application';

  @override
  String themeSelected(Object theme) {
    return 'Theme selected: $theme';
  }

  @override
  String languageSelected(Object language) {
    return 'Language selected: $language';
  }

  @override
  String get notificationsSaved => 'Notification settings saved';

  @override
  String get settingsSaved => 'Settings saved successfully!';

  @override
  String get userLoggedOut => 'User logged out of settings';

  @override
  String get appearance => 'Appearance';

  @override
  String get data => 'Data';

  @override
  String get useLocalData => 'Use local data';

  @override
  String get loadFromCache => 'Load data from cache on startup';

  @override
  String get clearCache => 'Clear cache';

  @override
  String get deleteAllData => 'Delete all saved data';

  @override
  String get dialog => 'Dialog';

  @override
  String get exampleDialog => 'Example dialog from profile';

  @override
  String get cancel => 'Cancel';

  @override
  String get ok => 'OK';

  @override
  String get edit => 'Edit';

  @override
  String get delete => 'Delete';

  @override
  String get clearCacheQuestion => 'Clear cache?';

  @override
  String get cacheWillBeDeleted =>
      'All saved data will be deleted. This action cannot be undone.';

  @override
  String get clear => 'Clear';

  @override
  String get cacheCleared => 'Cache successfully cleared';

  @override
  String cacheError(Object error) {
    return 'Error clearing cache: $error';
  }

  @override
  String get confirmLogout => 'Are you sure you want to logout?';

  @override
  String result(Object result) {
    return 'Result: $result';
  }

  @override
  String selected(Object selected) {
    return 'Selected: $selected';
  }

  @override
  String get cbrRates => 'Central Bank Exchange Rates';

  @override
  String get actualRates => 'Current exchange rates and financial news';

  @override
  String get loginToApp => 'Login to app';

  @override
  String get continueWithoutLogin => 'Continue without login';

  @override
  String get save => 'Save';

  @override
  String get name => 'Name';

  @override
  String get email => 'Email';

  @override
  String get id => 'ID';

  @override
  String get appTheme => 'App theme';

  @override
  String get guest => 'Guest';

  @override
  String get exchangeRates => 'Exchange Rates';

  @override
  String get currencies => 'Currencies';

  @override
  String get currenciesTab => 'Currencies';

  @override
  String get newsTab => 'News';

  @override
  String get portfolio => 'Portfolio';

  @override
  String get portfolioTab => 'Portfolio';

  @override
  String get analytics => 'Analytics';

  @override
  String get analyticsTab => 'Analytics';

  @override
  String profileUpdated(Object userName) {
    return 'Profile updated: $userName';
  }

  @override
  String get dateFormat => 'MM/dd/yyyy';

  @override
  String get timeFormat => 'HH:mm';

  @override
  String get dateTimeFormat => 'MM/dd/yyyy HH:mm';

  @override
  String get newsDateTimeFormat => 'EEE HH:mm MM/dd/yy';

  @override
  String get appName => 'Central Bank Exchange Rates';

  @override
  String get appThemeTitle => 'App Theme';

  @override
  String get lightTheme => 'Light';

  @override
  String get darkTheme => 'Dark';

  @override
  String get systemTheme => 'System';

  @override
  String get noInternet => 'No internet connection';

  @override
  String get usingSavedData => 'Using saved data';

  @override
  String get retry => 'Retry';

  @override
  String get loadingFromLocal => 'Loading from local storage';

  @override
  String get loadingExchangeRates => 'Loading exchange rates';

  @override
  String get searchByNameOrCode => 'Search by name or code';

  @override
  String get usingLocalData => 'Using local data';

  @override
  String get nothingFound => 'Nothing found';

  @override
  String get tryDifferentQuery => 'Try a different query';

  @override
  String get refreshData => 'Refresh data';

  @override
  String get errorOccurred => 'An error occurred';

  @override
  String dbSaveError(Object error) {
    return 'Error saving to database: $error';
  }

  @override
  String get nominal => 'Nominal';

  @override
  String nominalCount(Object value) {
    return 'Nominal: $value';
  }

  @override
  String get rubleSymbol => '₽';

  @override
  String get increase => 'increase';

  @override
  String get decrease => 'decrease';

  @override
  String get unchanged => 'unchanged';

  @override
  String changeSymbol(Object change) {
    return '$change';
  }

  @override
  String forNominal(Object nominal, Object units) {
    return 'for $nominal $units';
  }

  @override
  String get rateChange => 'Rate Change';

  @override
  String get currentRate => 'Current Rate';

  @override
  String get previousRate => 'Previous Rate';

  @override
  String get change => 'Change';

  @override
  String get changePercent => 'Change in %';

  @override
  String get information => 'Information';

  @override
  String get currencyCode => 'Currency Code';

  @override
  String get analyticsReports => 'Analytical Reports';

  @override
  String get analyticsDescription =>
      'This section presents graphs and analytics\non exchange rates and your investments';

  @override
  String get analyticsTrends => 'Trends';

  @override
  String get analyticsTrendsDescription => 'Trend analysis';

  @override
  String get analyticsForecasts => 'Forecasts';

  @override
  String get analyticsForecastsDescription => 'Exchange rate forecasts';

  @override
  String get analyticsReportsDescription => 'Detailed reports';

  @override
  String get analyticsComparison => 'Comparison';

  @override
  String get analyticsComparisonDescription => 'Currency comparison';

  @override
  String get analyticsWeeklyStats => 'Weekly statistics';

  @override
  String get analyticsTopGainer => 'Top gainer';

  @override
  String get analyticsTopGainerValue => 'USD +2.1%';

  @override
  String get analyticsTopLoser => 'Top loser';

  @override
  String get analyticsTopLoserValue => 'EUR -1.3%';

  @override
  String get analyticsVolatility => 'Volatility';

  @override
  String get analyticsVolatilityValue => 'Average';

  @override
  String get analyticsSaveButton => 'Save and exit';

  @override
  String get analyticsSaveMessage => 'Analysis saved';

  @override
  String get portfolioTitle => 'Your currency portfolio';

  @override
  String get portfolioDescription =>
      'This section will display information\nabout your currency assets and investments';

  @override
  String get portfolioBackButton => 'Go back';

  @override
  String get portfolioViewedMessage => 'Portfolio viewed';

  @override
  String get portfolioMonthlyReturn => 'Monthly return:';

  @override
  String get portfolioMonthlyReturnValue => '+5.2%';

  @override
  String get portfolioTotalValue => 'Total value:';

  @override
  String get portfolioTotalValueAmount => '125,430 ₽';

  @override
  String get symbol => 'Symbol';

  @override
  String get unit => 'unit';

  @override
  String get unitsFew => 'units';

  @override
  String get unitsMany => 'units';

  @override
  String units(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'units',
      one: 'unit',
    );
    return '$_temp0';
  }

  @override
  String unitsWithCount(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'units',
      one: 'unit',
    );
    return '$count $_temp0';
  }

  @override
  String nominalWithUnits(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# units',
      one: '# unit',
    );
    return '$_temp0';
  }

  @override
  String currencyUnits(num count, Object currency) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# units',
      one: '# unit',
    );
    return '$_temp0 of $currency';
  }
}
