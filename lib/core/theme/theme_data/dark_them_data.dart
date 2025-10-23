import 'package:flutter/material.dart';

import '../app_texts/app_fonts.dart';
import '../theme_manager/theme_extensions.dart';

ThemeData getDarkTheme(BuildContext context) {
  return ThemeData(
    scaffoldBackgroundColor: context.customAppColors.background,
    brightness: Brightness.dark,
    fontFamily: AppFonts.tajawal,
    colorScheme: ColorScheme.fromSeed(
      seedColor: context.customAppColors.primary700,
      brightness: Brightness.dark,
    ),
    textTheme: ThemeData.light().textTheme.apply(
      bodyColor: context.customAppColors.grey100,
      displayColor: context.customAppColors.grey100,
      fontFamily: AppFonts.tajawal,
    ),
  );
}
