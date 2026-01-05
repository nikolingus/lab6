import 'package:flutter/material.dart';
import 'theme_colors.dart';
import 'theme_fonts.dart';

class AppThemeData {
  final ThemeColors colors;
  final ThemeFonts fonts;
  final ThemeMode themeMode;

  const AppThemeData({
    required this.colors,
    required this.fonts,
    required this.themeMode,
  });

  factory AppThemeData.light() {
    return AppThemeData(
      colors: ThemeColors.light(),
      fonts: ThemeFonts.light(),
      themeMode: ThemeMode.light,
    );
  }

  factory AppThemeData.dark() {
    return AppThemeData(
      colors: ThemeColors.dark(),
      fonts: ThemeFonts.dark(),
      themeMode: ThemeMode.dark,
    );
  }
}

extension AppThemeDataExt on AppThemeData {
  ThemeData toMaterialTheme() {
    final isDark = themeMode == ThemeMode.dark;
    final themeColors = isDark ? ThemeColors.dark() : ThemeColors.light();
    final themeFonts = isDark ? ThemeFonts.dark() : ThemeFonts.light();
    
    return ThemeData(
      useMaterial3: true,
      brightness: isDark ? Brightness.dark : Brightness.light,
      colorScheme: ColorScheme(
        brightness: isDark ? Brightness.dark : Brightness.light,
        primary: themeColors.primary,
        onPrimary: themeColors.surface,
        secondary: themeColors.secondary,
        onSecondary: themeColors.surface,
        error: themeColors.error,
        onError: themeColors.surface,
        background: themeColors.background,
        onBackground: themeColors.text,
        surface: themeColors.surface,
        onSurface: themeColors.text,
      ),
      scaffoldBackgroundColor: themeColors.background,
      appBarTheme: AppBarTheme(
        backgroundColor: themeColors.surface,
        foregroundColor: themeColors.text,
        surfaceTintColor: Colors.transparent,
        titleTextStyle: themeFonts.titleMedium,
        elevation: 0,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: themeColors.surface,
        selectedItemColor: themeColors.primary,
        unselectedItemColor: themeColors.textSecondary,
        selectedLabelStyle: themeFonts.labelMedium,
        unselectedLabelStyle: themeFonts.labelMedium,
        elevation: 4,
        showSelectedLabels: true,
        showUnselectedLabels: true,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: themeColors.primary,
          foregroundColor: themeColors.surface,
          textStyle: themeFonts.labelLarge,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: themeColors.primary,
          textStyle: themeFonts.labelLarge,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: themeColors.surface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        hintStyle: themeFonts.bodyMedium.copyWith(color: themeColors.textSecondary),
      ),
      cardTheme: CardThemeData(
        color: themeColors.card,
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        margin: EdgeInsets.zero,
        clipBehavior: Clip.hardEdge,
      ),
      dividerTheme: DividerThemeData(
        color: themeColors.divider,
        thickness: 1,
        space: 0,
      ),
      textTheme: TextTheme(
        displayLarge: themeFonts.displayLarge,
        displayMedium: themeFonts.displayMedium,
        displaySmall: themeFonts.displaySmall,
        headlineLarge: themeFonts.headlineLarge,
        headlineMedium: themeFonts.headlineMedium,
        headlineSmall: themeFonts.headlineSmall,
        titleLarge: themeFonts.titleLarge,
        titleMedium: themeFonts.titleMedium,
        titleSmall: themeFonts.titleSmall,
        bodyLarge: themeFonts.bodyLarge,
        bodyMedium: themeFonts.bodyMedium,
        bodySmall: themeFonts.bodySmall,
        labelLarge: themeFonts.labelLarge,
        labelMedium: themeFonts.labelMedium,
        labelSmall: themeFonts.labelSmall,
      ),
      extensions: <ThemeExtension<dynamic>>[
        themeColors,
        themeFonts,
      ],
    );
  }
}