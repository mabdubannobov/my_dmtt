import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract class AppTextStyles {
  const AppTextStyles._();

  static const String fontFamily = 'Urbanist';

  static TextStyle bottomLabelStyle = const TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    letterSpacing: 0.2,
    fontSize: 12,
  );
  static TextStyle titleStyle = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
    fontSize: 24,
    color: AppColors.greyscaleLight.shade900,
  );

  // Bold Style

  static TextStyle boldStyle = const TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
  );

  // Semi Bold Style

  static TextStyle semiBoldStyle = const TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
  );

  // Medium Style

  static TextStyle mediumStyle = const TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
  );

  // Medium Style

  static TextStyle regularStyle = const TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
  );
}
