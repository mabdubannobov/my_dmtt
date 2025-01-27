import 'package:flutter/material.dart';

abstract class AppColors {
  const AppColors._();

  static const Color success = Color(0xFF1BAC4B);
  static const Color info = Color(0xFF246BFD);
  static const Color warning = Color(0xFFFACC15);
  static const Color error = Color(0xFFF75555);
  static const Color disabled = Color(0xFFD8D8D8);
  static const Color disabledButton = Color(0xFF29974D);

  static const Color dark1 = Color(0xFF181A20);
  static const Color dark2 = Color(0xFF1F222A);
  static const Color dark3 = Color(0xFF35383F);

  static PrimaryColor primaryLight = const PrimaryColor(
    0xFF1BAC4B,
    <int, Color>{
      500: Color(0xFF1BAC4B),
      400: Color(0xFF49BD6F),
      300: Color(0xFF76CD93),
      200: Color(0xFFA4DEB7),
      100: Color(0xFFE8F7ED),
    },
  );

  static GreyScaleColor greyscaleLight = const GreyScaleColor(
    0xFF212121,
    <int, Color>{
      900: Color(0xFF212121),
      800: Color(0xFF424242),
      700: Color(0xFF616161),
      600: Color(0xFF757575),
      500: Color(0xFF9E9E9E),
      400: Color(0xFFBDBDBD),
      300: Color(0xFFE0E0E0),
      200: Color(0xFFEEEEEE),
      100: Color(0xFFF5F5F5),
      50: Color(0xFFFAFAFA),
    },
  );
}

class PrimaryColor extends ColorSwatch<int> {
  const PrimaryColor(super.primary, super.swatch);

  Color get shade500 => this[500]!;
  Color get shade400 => this[400]!;
  Color get shade300 => this[300]!;
  Color get shade200 => this[200]!;
  Color get shade100 => this[100]!;
}

class GreyScaleColor extends ColorSwatch<int> {
  const GreyScaleColor(super.primary, super.swatch);

  Color get shade900 => this[900]!;
  Color get shade800 => this[800]!;
  Color get shade700 => this[700]!;
  Color get shade600 => this[600]!;
  Color get shade500 => this[500]!;
  Color get shade400 => this[400]!;
  Color get shade300 => this[300]!;
  Color get shade200 => this[200]!;
  Color get shade100 => this[100]!;
  Color get shade50 => this[50]!;
}
