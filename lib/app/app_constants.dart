class AppConstants {
  static const String dateFormat = 'dd.MM.yyyy';
  static const String timeFormat = 'HH:mm';
  static const String dateTimeFormat = '$dateFormat $timeFormat';
  
  static const String baseUrl = 'https://api.example.com';
  static const String currencyEndpoint = '/currencies';
  static const String newsEndpoint = '/news';
  
  static const List<String> rssFeeds = [
    'https://www.cbr.ru/rss/eventrss/',
    'https://www.banki.ru/xml/news.rss',
  ];
  

  static const String newsDateTimeFormat = 'E HH:mm dd.MM.yy';
  static const String ruLocale = 'ru_RU';
  static const String enLocale = 'en_US';
 
  static const String appName = 'Курсы валют ЦБ РФ';
}