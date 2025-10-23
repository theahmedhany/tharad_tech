import 'package:flutter/material.dart';

import 'dark_app_colors.dart';
import 'light_app_colors.dart';

class CustomAppColors {
  const CustomAppColors._({
    // ---------- Primary ----------
    required this.primary900,
    required this.primary800,
    required this.primary700,
    required this.primary600,
    required this.primary500,
    required this.primary400,
    required this.primary300,
    required this.primary200,
    required this.primary100,
    required this.primary50,

    // ---------- Grey Scale ----------
    required this.grey900,
    required this.grey800,
    required this.grey700,
    required this.grey600,
    required this.grey500,
    required this.grey400,
    required this.grey300,
    required this.grey200,
    required this.grey100,
    required this.grey50,
    required this.grey0,

    // ---------- Neutral ----------
    required this.white,
    required this.black,
    required this.background,

    // ---------- Status ----------
    required this.error,
    required this.warning,
    required this.success,
    required this.info,

    // ---------- Gradient ----------
    required this.primaryGradient,
  });

  // ---------- Primary ----------
  final Color primary900;
  final Color primary800;
  final Color primary700;
  final Color primary600;
  final Color primary500;
  final Color primary400;
  final Color primary300;
  final Color primary200;
  final Color primary100;
  final Color primary50;

  // ---------- Grey Scale ----------
  final Color grey900;
  final Color grey800;
  final Color grey700;
  final Color grey600;
  final Color grey500;
  final Color grey400;
  final Color grey300;
  final Color grey200;
  final Color grey100;
  final Color grey50;
  final Color grey0;

  // ---------- Neutral ----------
  final Color white;
  final Color black;
  final Color background;

  // ---------- Status ----------
  final Color error;
  final Color warning;
  final Color success;
  final Color info;

  // ---------- Gradient ----------
  final LinearGradient primaryGradient;

  /// Factory for Light Theme
  factory CustomAppColors.light() {
    return const CustomAppColors._(
      // Primary
      primary900: LightAppColors.primary900,
      primary800: LightAppColors.primary800,
      primary700: LightAppColors.primary700,
      primary600: LightAppColors.primary600,
      primary500: LightAppColors.primary500,
      primary400: LightAppColors.primary400,
      primary300: LightAppColors.primary300,
      primary200: LightAppColors.primary200,
      primary100: LightAppColors.primary100,
      primary50: LightAppColors.primary50,

      // Grey Scale
      grey900: LightAppColors.grey900,
      grey800: LightAppColors.grey800,
      grey700: LightAppColors.grey700,
      grey600: LightAppColors.grey600,
      grey500: LightAppColors.grey500,
      grey400: LightAppColors.grey400,
      grey300: LightAppColors.grey300,
      grey200: LightAppColors.grey200,
      grey100: LightAppColors.grey100,
      grey50: LightAppColors.grey50,
      grey0: LightAppColors.grey0,

      // Neutral
      white: LightAppColors.white,
      black: LightAppColors.black,
      background: LightAppColors.background,

      // Status
      error: LightAppColors.error,
      warning: LightAppColors.warning,
      success: LightAppColors.success,
      info: LightAppColors.info,

      // Gradient
      primaryGradient: LightAppColors.primaryGradient,
    );
  }

  /// Factory for Dark Theme
  factory CustomAppColors.dark() {
    return const CustomAppColors._(
      // Primary
      primary900: DarkAppColors.primary900,
      primary800: DarkAppColors.primary800,
      primary700: DarkAppColors.primary700,
      primary600: DarkAppColors.primary600,
      primary500: DarkAppColors.primary500,
      primary400: DarkAppColors.primary400,
      primary300: DarkAppColors.primary300,
      primary200: DarkAppColors.primary200,
      primary100: DarkAppColors.primary100,
      primary50: DarkAppColors.primary50,

      // Grey Scale
      grey900: DarkAppColors.grey900,
      grey800: DarkAppColors.grey800,
      grey700: DarkAppColors.grey700,
      grey600: DarkAppColors.grey600,
      grey500: DarkAppColors.grey500,
      grey400: DarkAppColors.grey400,
      grey300: DarkAppColors.grey300,
      grey200: DarkAppColors.grey200,
      grey100: DarkAppColors.grey100,
      grey50: DarkAppColors.grey50,
      grey0: DarkAppColors.grey0,

      // Neutral
      white: DarkAppColors.white,
      black: DarkAppColors.black,
      background: DarkAppColors.background,

      // Status
      error: DarkAppColors.error,
      warning: DarkAppColors.warning,
      success: DarkAppColors.success,
      info: DarkAppColors.info,

      // Gradient
      primaryGradient: DarkAppColors.primaryGradient,
    );
  }

  /// Helper to get the right colors from context
  static CustomAppColors of(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return brightness == Brightness.dark
        ? CustomAppColors.dark()
        : CustomAppColors.light();
  }
}
