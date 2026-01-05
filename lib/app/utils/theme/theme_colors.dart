import 'package:flutter/material.dart';

@immutable
class ThemeColors extends ThemeExtension<ThemeColors> {
  final Color primary;
  final Color secondary;
  final Color background;
  final Color surface;
  final Color onSurface;
  final Color text;
  final Color textSecondary;
  final Color error;
  final Color success;
  final Color warning;
  final Color shadow;
  final Color divider;
  final Color card;

  const ThemeColors({
    required this.primary,
    required this.secondary,
    required this.background,
    required this.surface,
    required this.onSurface,
    required this.text,
    required this.textSecondary,
    required this.error,
    required this.success,
    required this.warning,
    required this.shadow,
    required this.divider,
    required this.card,
  });

  factory ThemeColors.light() {
    return const ThemeColors(
      primary: Color(0xFF3929C7),
      secondary: Color(0xFF7F7F7F),
      background: Color(0xFFF2F2F2),
      surface: Colors.white,
      onSurface: Colors.black,
      text: Colors.black,
      textSecondary: Color(0xFF666666),
      error: Color(0xFFE53935),
      success: Color(0xFF4CAF50),
      warning: Color(0xFFFF9800),
      shadow: Color(0x1A000000),
      divider: Color(0xFFE0E0E0),
      card: Colors.white,
    );
  }

  factory ThemeColors.dark() {
    return const ThemeColors(
      primary: Color(0xFF6C63FF),
      secondary: Color(0xFFA0A0A0),
      background: Color(0xFF121212),
      surface: Color(0xFF1E1E1E),
      onSurface: Colors.white,
      text: Colors.white,
      textSecondary: Color(0xFFB0B0B0),
      error: Color(0xFFCF6679),
      success: Color(0xFF81C784),
      warning: Color(0xFFFFB74D),
      shadow: Color(0x33000000),
      divider: Color(0xFF333333),
      card: Color(0xFF252525),
    );
  }

  @override
  ThemeExtension<ThemeColors> copyWith({
    Color? primary,
    Color? secondary,
    Color? background,
    Color? surface,
    Color? onSurface,
    Color? text,
    Color? textSecondary,
    Color? error,
    Color? success,
    Color? warning,
    Color? shadow,
    Color? divider,
    Color? card,
  }) {
    return ThemeColors(
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      background: background ?? this.background,
      surface: surface ?? this.surface,
      onSurface: onSurface ?? this.onSurface,
      text: text ?? this.text,
      textSecondary: textSecondary ?? this.textSecondary,
      error: error ?? this.error,
      success: success ?? this.success,
      warning: warning ?? this.warning,
      shadow: shadow ?? this.shadow,
      divider: divider ?? this.divider,
      card: card ?? this.card,
    );
  }

  @override
  ThemeExtension<ThemeColors> lerp(ThemeExtension<ThemeColors>? other, double t) {
    if (other is! ThemeColors) {
      return this;
    }
    return ThemeColors(
      primary: Color.lerp(primary, other.primary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      background: Color.lerp(background, other.background, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      onSurface: Color.lerp(onSurface, other.onSurface, t)!,
      text: Color.lerp(text, other.text, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      error: Color.lerp(error, other.error, t)!,
      success: Color.lerp(success, other.success, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      shadow: Color.lerp(shadow, other.shadow, t)!,
      divider: Color.lerp(divider, other.divider, t)!,
      card: Color.lerp(card, other.card, t)!,
    );
  }
}