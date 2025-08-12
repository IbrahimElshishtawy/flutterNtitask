import 'package:flutter/material.dart';
import 'package:nti/widget/custom_button.dart';
import 'package:nti/widget/result_bar.dart';
import '../models/bmi_result_model.dart';
import '../core/constants/strings.dart';
import '../core/constants/styles.dart';

import 'gender_page.dart';

class ResultPage extends StatelessWidget {
  final BMIResultModel result;
  ResultPage({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // خلفية متدرجة هادية
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFa8edea), Color(0xFFfed6e3)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // العنوان في الأعلى بشاشة عادية (بدون AppBar)
                Text(
                  AppStrings.yourBMIResult,
                  style: AppStyles.titleStyle.copyWith(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple.shade700,
                    shadows: [
                      Shadow(
                        blurRadius: 3,
                        color: Colors.deepPurple.shade200,
                        offset: const Offset(1, 1),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 30),

                // صندوق النتيجة بظل وحواف دائرية
                Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  color: Colors.white.withOpacity(0.9),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 32,
                    ),
                    child: Column(
                      children: [
                        Text(
                          AppStrings.yourBMIIs,
                          style: AppStyles.subtitleStyle.copyWith(
                            fontSize: 22,
                            color: Colors.grey[800],
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),

                        // قيمة الـ BMI
                        Text(
                          result.bmiValue.toStringAsFixed(1),
                          style: AppStyles.bmiValueStyle.copyWith(
                            color: result.statusColor,
                            fontSize: 72,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8),

                        // الحالة مع أيقونة تعبيرية
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _statusIcon(result.status, result.statusColor),
                            const SizedBox(width: 10),
                            Text(
                              result.status,
                              style: AppStyles.subtitleStyle.copyWith(
                                color: result.statusColor,
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 24),

                        // شريط النتيجة
                        ResultBar(
                          currentBMI: result.bmiValue,
                          bmi: result.bmiValue,
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 40),

                // صندوق النصيحة الصحية
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 20,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.deepPurple.shade50.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.deepPurple.shade100.withOpacity(0.6),
                        blurRadius: 12,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: _buildStatusTip(result.status),
                ),

                const Spacer(),

                // زر إعادة الحساب مع تأثير ظل
                CustomButton(
                  text: AppStrings.recalculateEn,
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const GenderPage(),
                      ),
                      (route) => false,
                    );
                  },
                  buttonColor: Colors.deepPurple.shade700,
                  textStyle: AppStyles.buttonTextStyle.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        blurRadius: 4,
                        color: Colors.black26,
                        offset: const Offset(1, 2),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// أيقونة تعبيرية حسب الحالة
  Widget _statusIcon(String status, Color color) {
    IconData iconData;
    switch (status) {
      case AppStrings.statusUnderweight:
        iconData = Icons.sentiment_dissatisfied;
        break;
      case AppStrings.statusNormal:
        iconData = Icons.sentiment_satisfied_alt;
        break;
      case AppStrings.statusOverweight:
        iconData = Icons.sentiment_neutral;
        break;
      default:
        iconData = Icons.sentiment_very_dissatisfied;
    }
    return Icon(iconData, color: color, size: 36);
  }

  /// نصائح صحية حسب الحالة
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
      style: AppStyles.tipTextStyle.copyWith(
        fontSize: 16,
        color: Colors.deepPurple.shade800,
        fontWeight: FontWeight.w600,
      ),
      textAlign: TextAlign.center,
    );
  }
}
