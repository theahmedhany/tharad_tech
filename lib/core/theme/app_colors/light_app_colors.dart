import 'package:flutter/material.dart';

class LightAppColors {
  // ---------- Primary Palette ----------
  static const Color primary900 = Color(0xFF0F2A2B);
  static const Color primary800 = Color(0xFF1B3D3F);
  static const Color primary700 = Color(0xFF265355);
  static const Color primary600 = Color(0xFF3D6D6E);
  static const Color primary500 = Color(0xFF548888);
  static const Color primary400 = Color(0xFF72A1A1);
  static const Color primary300 = Color(0xFF96BFBF);
  static const Color primary200 = Color(0xFFBDDADA);
  static const Color primary100 = Color(0xFFE3F2F2);
  static const Color primary50 = Color(0xFFF2FAFA);

  // ---------- Grey Scale ----------
  static const Color grey900 = Color(0xFF212121);
  static const Color grey800 = Color(0xFF424242);
  static const Color grey700 = Color(0xFF616161);
  static const Color grey600 = Color(0xFF757575);
  static const Color grey500 = Color(0xFF9E9E9E);
  static const Color grey400 = Color(0xFFBDBDBD);
  static const Color grey300 = Color(0xFFE0E0E0);
  static const Color grey200 = Color(0xFFEEEEEE);
  static const Color grey100 = Color(0xFFF5F5F5);
  static const Color grey50 = Color(0xFFFAFAFA);
  static const Color grey0 = Color(0xFFFFFFFF);

  // ---------- Neutral ----------
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color background = Color(0xFFFAFAFA);

  // ---------- Status ----------
  static const Color error = Color(0xFFF75555);
  static const Color warning = Color(0xFFFACC15);
  static const Color success = Color(0xFF4ADE80);
  static const Color info = Color(0xFF246BFD);

  // ---------- Gradient ----------
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF5CC7A3), Color(0xFF265355)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
