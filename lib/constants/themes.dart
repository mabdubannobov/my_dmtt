import 'package:flutter/material.dart';
import 'package:my_dmtt/constants/app_colors.dart';

import 'app_text_styles.dart';

final ThemeData lightTheme = ThemeData(
  fontFamily: 'Urbanist',
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.white,
    foregroundColor: Colors.white,
    titleTextStyle: TextStyle(
      fontFamily: 'Urbanist',
      fontSize: 24,
      height: 1.2,
      fontWeight: FontWeight.w700,
      color: AppColors.greyscaleLight,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    elevation: 0,
    showUnselectedLabels: true,
    backgroundColor: Colors.white,
    type: BottomNavigationBarType.fixed,
    selectedLabelStyle: AppTextStyles.bottomLabelStyle,
    unselectedLabelStyle: AppTextStyles.bottomLabelStyle,
    selectedItemColor: AppColors.primaryLight,
    unselectedItemColor: AppColors.greyscaleLight.shade500,
  ),
  textTheme: TextTheme(
    bodyLarge: TextStyle(
      fontSize: 18,
      letterSpacing: 0.2,
      fontWeight: FontWeight.w600,
      color: AppColors.greyscaleLight,
    ),
    bodyMedium: TextStyle(
      fontSize: 16,
      height: 1.4,
      letterSpacing: 0.2,
      fontWeight: FontWeight.w500,
      color: AppColors.greyscaleLight.shade800,
    ),
    headlineMedium: TextStyle(
      fontSize: 24,
      height: 1.2,
      fontWeight: FontWeight.w900,
      color: AppColors.greyscaleLight,
    ),
    headlineSmall: TextStyle(
      fontSize: 20,
      height: 1.2,
      fontWeight: FontWeight.w700,
      color: AppColors.greyscaleLight,
    ),
  ),
);

final ThemeData darkTheme = ThemeData(
  fontFamily: 'Urbanist',
  scaffoldBackgroundColor: AppColors.dark1,
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.dark1,
    foregroundColor: AppColors.dark1,
    titleTextStyle: TextStyle(
      fontFamily: 'Urbanist',
      fontSize: 24,
      height: 1.2,
      color: Colors.white,
      fontWeight: FontWeight.w700,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    elevation: 0,
    showUnselectedLabels: true,
    backgroundColor: AppColors.dark1,
    type: BottomNavigationBarType.fixed,
    selectedLabelStyle: AppTextStyles.bottomLabelStyle,
    unselectedLabelStyle: AppTextStyles.bottomLabelStyle,
    selectedItemColor: AppColors.primaryLight,
    unselectedItemColor: AppColors.greyscaleLight.shade500,
  ),
  textTheme: TextTheme(
    bodyLarge: const TextStyle(
      fontSize: 18,
      letterSpacing: 0.2,
      color: Colors.white,
      fontWeight: FontWeight.w600,
    ),
    bodyMedium: TextStyle(
      fontSize: 16,
      height: 1.4,
      letterSpacing: 0.2,
      fontWeight: FontWeight.w500,
      color: AppColors.greyscaleLight.shade300,
    ),
    headlineMedium: const TextStyle(
      fontSize: 24,
      height: 1.2,
      color: Colors.white,
      fontWeight: FontWeight.w900,
    ),
    headlineSmall: const TextStyle(
      fontSize: 20,
      height: 1.2,
      color: Colors.white,
      fontWeight: FontWeight.w700,
    ),
  ),
  listTileTheme: const ListTileThemeData(
    iconColor: Colors.white,
  ),
);
