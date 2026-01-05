import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dart_lab1/app/gen/l10n/l10n.dart'; 
import './theme/theme_colors.dart';
import './theme/theme_fonts.dart';

final _cachedLocale = AppLocalizationsRu();

extension ContextExt on BuildContext {
  
  ThemeColors get colors => Theme.of(this).extension<ThemeColors>()!;
  ThemeFonts get fonts => Theme.of(this).extension<ThemeFonts>()!;

  Color get primaryColor => colors.primary;
  Color get backgroundColor => colors.background;
  Color get surfaceColor => colors.surface;
  Color get textColor => colors.text;
  Color get textSecondaryColor => colors.textSecondary;
  Color get dividerColor => colors.divider;
  Color get cardColor => colors.card;

  TextStyle get headlineMediumStyle => fonts.headlineMedium;
  TextStyle get titleLargeStyle => fonts.titleLarge;
  TextStyle get titleMediumStyle => fonts.titleMedium;
  TextStyle get titleSmallStyle => fonts.titleSmall;
  TextStyle get bodyLargeStyle => fonts.bodyLarge;
  TextStyle get bodyMediumStyle => fonts.bodyMedium;
  TextStyle get bodySmallStyle => fonts.bodySmall;
  TextStyle get labelLargeStyle => fonts.labelLarge;
  TextStyle get labelMediumStyle => fonts.labelMedium;

  
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;
  
  bool get isPortrait => MediaQuery.of(this).orientation == Orientation.portrait;
  bool get isLandscape => MediaQuery.of(this).orientation == Orientation.landscape;

  
  T readProvider<T>() => Provider.of<T>(this, listen: false);
  T watchProvider<T>() => Provider.of<T>(this);

 
  AppLocalizations get loc => AppLocalizations.of(this) ?? _cachedLocale;
}