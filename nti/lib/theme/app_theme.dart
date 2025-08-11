// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import '../core/constants/colors.dart';
import '../core/constants/styles.dart';

class AppTheme {
  /// Light Theme
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primaryBlue,
    scaffoldBackgroundColor: AppColors.backgroundLight,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primaryBlue,
      elevation: 0,
      titleTextStyle: AppStyles.titleStyle,
      iconTheme: IconThemeData(color: Colors.white),
    ),
    textTheme: const TextTheme(
      headlineLarge: AppStyles.titleStyle,
      bodyLarge: AppStyles.subtitleStyle,
    ),
    sliderTheme: SliderThemeData(
      activeTrackColor: AppColors.primaryBlue,
      inactiveTrackColor: AppColors.lightBlue.withOpacity(0.3),
      thumbColor: AppColors.primaryBlue,
      overlayColor: AppColors.primaryBlue.withOpacity(0.2),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryBlue,
        foregroundColor: Colors.white,
        textStyle: AppStyles.buttonTextStyle,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
  );

  /// Dark Theme
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primaryBlue,
    scaffoldBackgroundColor: AppColors.backgroundDark,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.backgroundDark,
      elevation: 0,
      titleTextStyle: AppStyles.titleStyle,
      iconTheme: IconThemeData(color: Colors.white),
    ),
    textTheme: const TextTheme(
      headlineLarge: AppStyles.titleStyle,
      bodyLarge: AppStyles.subtitleStyle,
    ),
    sliderTheme: SliderThemeData(
      activeTrackColor: AppColors.primaryBlue,
      inactiveTrackColor: Colors.white24,
      thumbColor: AppColors.primaryBlue,
      overlayColor: AppColors.primaryBlue.withOpacity(0.2),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryBlue,
        foregroundColor: Colors.white,
        textStyle: AppStyles.buttonTextStyle,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
  );
}
