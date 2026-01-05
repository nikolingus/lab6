import 'package:flutter/material.dart';
import '../../domain/models/app_theme_mode.dart';
import '../utils/context_ext.dart';

class ThemeModeSelectorBS extends StatelessWidget {
  final AppThemeMode currentThemeMode;
  final ValueChanged<AppThemeMode> onThemeModeChanged;

  const ThemeModeSelectorBS({
    super.key,
    required this.currentThemeMode,
    required this.onThemeModeChanged,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final fonts = context.fonts;

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: colors.divider,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            context.loc.appThemeTitle,
            style: fonts.titleLarge.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          ...AppThemeMode.values.map((themeMode) {
            return ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(
                _getIconForThemeMode(themeMode),
                color: colors.primary,
              ),
              title: Text(
                _getLabelForThemeMode(themeMode, context),
                style: fonts.bodyLarge,
              ),
              trailing: themeMode == currentThemeMode
                  ? Icon(
                      Icons.check,
                      color: colors.primary,
                    )
                  : null,
              onTap: () {
                onThemeModeChanged(themeMode);
                Navigator.pop(context);
              },
            );
          }),
        ],
      ),
    );
  }

  IconData _getIconForThemeMode(AppThemeMode themeMode) {
    switch (themeMode) {
      case AppThemeMode.light:
        return Icons.light_mode;
      case AppThemeMode.dark:
        return Icons.dark_mode;
      case AppThemeMode.system:
        return Icons.brightness_auto;
    }
  }

  String _getLabelForThemeMode(AppThemeMode themeMode, BuildContext context) {
    switch (themeMode) {
      case AppThemeMode.light:
        return context.loc.lightTheme;
      case AppThemeMode.dark:
        return context.loc.darkTheme;
      case AppThemeMode.system:
        return context.loc.systemTheme;
    }
  }
}