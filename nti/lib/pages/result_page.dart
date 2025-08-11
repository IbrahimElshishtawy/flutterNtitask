import 'package:flutter/material.dart';
import 'package:nti/widget/custom_button.dart';
import 'package:nti/widget/result_bar.dart';
import '../models/bmi_result_model.dart';
import '../core/constants/strings.dart';
import '../core/constants/styles.dart';

import 'gender_page.dart';

class ResultPage extends StatelessWidget {
  final BMIResultModel result;
  ResultPage({super.key, required this.result}); // حذف const

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.yourBMIResult), // استخدم ثابت موجود
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Title
            Text(
              AppStrings.yourBMIIs,
              style: AppStyles.titleStyle.copyWith(fontSize: 26),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            // BMI Value
            Text(
              result.bmiValue.toStringAsFixed(1),
              style: AppStyles.bmiValueStyle.copyWith(
                color: result.statusColor,
                fontSize: 48,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 8),

            // Status Text
            Text(
              result.status,
              style: AppStyles.subtitleStyle.copyWith(
                color: result.statusColor,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 30),

            // Result Bar
            ResultBar(currentBMI: result.bmiValue, bmi: result.bmiValue),

            const SizedBox(height: 40),

            // Health Tip
            _buildStatusTip(result.status),

            const Spacer(),

            // Recalculate Button
            CustomButton(
              text: AppStrings.recalculateEn,
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const GenderPage()),
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  /// Health tips based on BMI category
  Widget _buildStatusTip(String status) {
    String tip;
    switch (status) {
      case AppStrings.statusUnderweight:
        tip =
            "You are under the normal weight range. Consider a healthy diet rich in proteins and carbohydrates.";
        break;
      case AppStrings.statusNormal:
        tip =
            "You are within the normal weight range. Maintain your current lifestyle and keep exercising.";
        break;
      case AppStrings.statusOverweight:
        tip =
            "You are above the normal weight range. Try reducing calories and increasing physical activity.";
        break;
      default:
        tip =
            "You are in the obesity range. Please consult a healthcare professional for guidance.";
    }

    return Text(
      tip,
      style: AppStyles.tipTextStyle.copyWith(fontSize: 16),
      textAlign: TextAlign.center,
    );
  }
}
