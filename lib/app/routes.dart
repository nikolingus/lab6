class AppRoutes {
  static const home = '/';
  static const currencyList = '/currencyList';
  static const currencyDetail = '/currencyDetail';
  static const newsList = '/newsList';
  static const settings = '/settings';
  static const profile = '/profile';
  static const portfolio = '/portfolio';    
  static const analytics = '/analytics';
  static const login = '/login'; 
}

class CurrencyDetailArguments {
  final String title;
  final String currencyCode;
  final String currentPrice;

  CurrencyDetailArguments({
    required this.title,
    required this.currencyCode,
    required this.currentPrice,
  });
}