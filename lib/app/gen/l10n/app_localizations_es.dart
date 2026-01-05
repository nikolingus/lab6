// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Ayudador';

  @override
  String get login => 'Iniciar sesión';

  @override
  String get logout => 'Cerrar sesión';

  @override
  String get currencyRate => 'Tasa de Cambio';

  @override
  String get news => 'Noticias';

  @override
  String get profile => 'Perfil';

  @override
  String get theme => 'Tema';

  @override
  String get light => 'Claro';

  @override
  String get dark => 'Oscuro';

  @override
  String get system => 'Sistema';

  @override
  String get search => 'Buscar';

  @override
  String get searchHint => 'Ingrese consulta';

  @override
  String get loading => 'Cargando';

  @override
  String get error => 'Error';

  @override
  String get tryAgain => 'Intentar de nuevo';

  @override
  String get settings => 'Configuraciones';

  @override
  String get language => 'Idioma';

  @override
  String get russian => 'Ruso';

  @override
  String get english => 'Inglés';

  @override
  String get spanish => 'Español';

  @override
  String get errorPage => 'Error';

  @override
  String get pageNotFound => 'Página no encontrada';

  @override
  String pageNotExist(Object pageName) {
    return 'La página $pageName no existe';
  }

  @override
  String get goToHome => 'Ir al inicio';

  @override
  String get themeSelection => 'Selección de tema de color';

  @override
  String get languageSelection => 'Selección de idioma de la aplicación';

  @override
  String get notifications => 'Notificaciones';

  @override
  String get notificationsSettings => 'Configuración de notificaciones';

  @override
  String get aboutApp => 'Acerca de la aplicación';

  @override
  String get close => 'Cerrar';

  @override
  String get aboutAppVersion =>
      'Versión 1.0.0\n\nAplicación de seguimiento de tipos de cambio';

  @override
  String themeSelected(Object theme) {
    return 'Tema seleccionado: $theme';
  }

  @override
  String languageSelected(Object language) {
    return 'Idioma seleccionado: $language';
  }

  @override
  String get notificationsSaved => 'Configuración de notificaciones guardada';

  @override
  String get settingsSaved => '¡Configuraciones guardadas exitosamente!';

  @override
  String get userLoggedOut => 'Usuario cerró sesión desde configuraciones';

  @override
  String get appearance => 'Apariencia';

  @override
  String get data => 'Datos';

  @override
  String get useLocalData => 'Usar datos locales';

  @override
  String get loadFromCache => 'Cargar datos del caché al iniciar';

  @override
  String get clearCache => 'Limpiar caché';

  @override
  String get deleteAllData => 'Eliminar todos los datos guardados';

  @override
  String get dialog => 'Diálogo';

  @override
  String get exampleDialog => 'Ejemplo de diálogo del perfil';

  @override
  String get cancel => 'Cancelar';

  @override
  String get ok => 'OK';

  @override
  String get edit => 'Editar';

  @override
  String get delete => 'Eliminar';

  @override
  String get clearCacheQuestion => '¿Limpiar caché?';

  @override
  String get cacheWillBeDeleted =>
      'Todos los datos guardados serán eliminados. Esta acción no se puede deshacer.';

  @override
  String get clear => 'Limpiar';

  @override
  String get cacheCleared => 'Caché limpiado exitosamente';

  @override
  String cacheError(Object error) {
    return 'Error al limpiar caché: $error';
  }

  @override
  String get confirmLogout => '¿Está seguro de que desea cerrar sesión?';

  @override
  String result(Object result) {
    return 'Resultado: $result';
  }

  @override
  String selected(Object selected) {
    return 'Seleccionado: $selected';
  }

  @override
  String get cbrRates => 'Tasas de cambio del Banco Central';

  @override
  String get actualRates => 'Tasas de cambio actuales y noticias financieras';

  @override
  String get loginToApp => 'Iniciar sesión en la aplicación';

  @override
  String get continueWithoutLogin => 'Continuar sin iniciar sesión';

  @override
  String get save => 'Guardar';

  @override
  String get name => 'Nombre';

  @override
  String get email => 'Email';

  @override
  String get id => 'ID';

  @override
  String get appTheme => 'Tema de la aplicación';

  @override
  String get guest => 'Invitado';

  @override
  String get exchangeRates => 'Tasas de cambio';

  @override
  String get currencies => 'Monedas';

  @override
  String get currenciesTab => 'Monedas';

  @override
  String get newsTab => 'Noticias';

  @override
  String get portfolio => 'Portafolio';

  @override
  String get portfolioTab => 'Portafolio';

  @override
  String get analytics => 'Analítica';

  @override
  String get analyticsTab => 'Analítica';

  @override
  String profileUpdated(Object userName) {
    return 'Perfil actualizado: $userName';
  }

  @override
  String get dateFormat => 'dd/MM/yyyy';

  @override
  String get timeFormat => 'HH:mm';

  @override
  String get dateTimeFormat => 'dd/MM/yyyy HH:mm';

  @override
  String get newsDateTimeFormat => 'E HH:mm dd/MM/yy';

  @override
  String get appName => 'Tasas de cambio del Banco Central';

  @override
  String get appThemeTitle => 'Tema de la aplicación';

  @override
  String get lightTheme => 'Claro';

  @override
  String get darkTheme => 'Oscuro';

  @override
  String get systemTheme => 'Sistema';

  @override
  String get noInternet => 'Sin conexión a internet';

  @override
  String get usingSavedData => 'Usando datos guardados';

  @override
  String get retry => 'Reintentar';

  @override
  String get loadingFromLocal => 'Cargando desde almacenamiento local';

  @override
  String get loadingExchangeRates => 'Cargando tasas de cambio';

  @override
  String get searchByNameOrCode => 'Buscar por nombre o código';

  @override
  String get usingLocalData => 'Usando datos locales';

  @override
  String get nothingFound => 'Nada encontrado';

  @override
  String get tryDifferentQuery => 'Intente una consulta diferente';

  @override
  String get refreshData => 'Actualizar datos';

  @override
  String get errorOccurred => 'Ocurrió un error';

  @override
  String dbSaveError(Object error) {
    return 'Error al guardar en la base de datos: $error';
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
  String get increase => 'aumento';

  @override
  String get decrease => 'disminución';

  @override
  String get unchanged => 'sin cambios';

  @override
  String changeSymbol(Object change) {
    return '$change';
  }

  @override
  String forNominal(Object nominal, Object units) {
    return 'por $nominal $units';
  }

  @override
  String get rateChange => 'Cambio de tasa';

  @override
  String get currentRate => 'Tasa actual';

  @override
  String get previousRate => 'Tasa anterior';

  @override
  String get change => 'Cambio';

  @override
  String get changePercent => 'Cambio en %';

  @override
  String get information => 'Información';

  @override
  String get currencyCode => 'Código de moneda';

  @override
  String get analyticsReports => 'Informes Analíticos';

  @override
  String get analyticsDescription =>
      'Esta sección presenta gráficos y análisis\nsobre tipos de cambio y sus inversiones';

  @override
  String get analyticsTrends => 'Tendencias';

  @override
  String get analyticsTrendsDescription => 'Análisis de tendencias';

  @override
  String get analyticsForecasts => 'Pronósticos';

  @override
  String get analyticsForecastsDescription => 'Pronósticos de tipos de cambio';

  @override
  String get analyticsReportsDescription => 'Informes detallados';

  @override
  String get analyticsComparison => 'Comparación';

  @override
  String get analyticsComparisonDescription => 'Comparación de monedas';

  @override
  String get analyticsWeeklyStats => 'Estadísticas semanales';

  @override
  String get analyticsTopGainer => 'Mayor ganancia';

  @override
  String get analyticsTopGainerValue => 'USD +2.1%';

  @override
  String get analyticsTopLoser => 'Mayor pérdida';

  @override
  String get analyticsTopLoserValue => 'EUR -1.3%';

  @override
  String get analyticsVolatility => 'Volatilidad';

  @override
  String get analyticsVolatilityValue => 'Promedio';

  @override
  String get analyticsSaveButton => 'Guardar y salir';

  @override
  String get analyticsSaveMessage => 'Análisis guardado';

  @override
  String get portfolioTitle => 'Su portafolio de divisas';

  @override
  String get portfolioDescription =>
      'Esta sección mostrará información\nsobre sus activos en divisas e inversiones';

  @override
  String get portfolioBackButton => 'Volver atrás';

  @override
  String get portfolioViewedMessage => 'Portafolio visto';

  @override
  String get portfolioMonthlyReturn => 'Rentabilidad mensual:';

  @override
  String get portfolioMonthlyReturnValue => '+5.2%';

  @override
  String get portfolioTotalValue => 'Valor total:';

  @override
  String get portfolioTotalValueAmount => '125.430 ₽';

  @override
  String get symbol => 'Símbolo';

  @override
  String get unit => 'unidad';

  @override
  String get unitsFew => 'unidades';

  @override
  String get unitsMany => 'unidades';

  @override
  String units(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'unidades',
      one: 'unidad',
    );
    return '$_temp0';
  }

  @override
  String unitsWithCount(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'unidades',
      one: 'unidad',
    );
    return '$count $_temp0';
  }

  @override
  String nominalWithUnits(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# unidades',
      one: '# unidad',
    );
    return '$_temp0';
  }

  @override
  String currencyUnits(num count, Object currency) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# unidades',
      one: '# unidad',
    );
    return '$_temp0 de $currency';
  }
}
