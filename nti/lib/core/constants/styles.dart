import 'package:flutter/material.dart';
import 'colors.dart';

class AppStyles {
  // Title Style
  static const TextStyle titleStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  // Subtitle Style
  static const TextStyle subtitleStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
  );

  // Button Text Style
  static const TextStyle buttonTextStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  // BMI Value Style (استخدمتها في ResultPage بدلاً من bmiNumberStyle)
  static const TextStyle bmiValueStyle = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryBlue,
  );

  // BMI Status Text Style
  static const TextStyle bmiStatusStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  // Tip Text Style (مستخدمة في ResultPage لعرض نصائح الصحة)
  static const TextStyle tipTextStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.textSecondary,
  );
}
