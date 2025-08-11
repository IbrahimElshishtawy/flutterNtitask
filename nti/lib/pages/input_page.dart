import 'package:flutter/material.dart';
import 'package:nti/pages/result_page.dart';
import 'package:nti/widget/custom_button.dart';
import 'package:nti/widget/height_slider.dart';
import 'package:nti/widget/weight_slider.dart';
import '../core/constants/strings.dart';
import '../core/constants/styles.dart';
import '../core/utils/bmi_calculator.dart';
import '../core/utils/validators.dart';
import '../models/bmi_result_model.dart';

import '../core/constants/colors.dart';

class InputPage extends StatefulWidget {
  final String gender;
  const InputPage({super.key, required this.gender});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  double _height = 170;
  double _weight = 65;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.appTitle), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Gender Info
            Text(
              "${AppStrings.chooseHeightWeight}\nGender: ${widget.gender}",
              style: AppStyles.titleStyle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),

            // Height Slider
            HeightSlider(
              height: _height,
              onChanged: (value) {
                setState(() {
                  _height = value;
                });
              },
            ),
            const SizedBox(height: 24),

            // Weight Slider
            WeightSlider(
              weight: _weight,
              onChanged: (value) {
                setState(() {
                  _weight = value;
                });
              },
            ),
            const SizedBox(height: 32),

            // Calculate BMI Button
            CustomButton(
              text: AppStrings.calculateBMI,
              onPressed: () {
                // التحقق من القيم
                final heightError = Validators.validateHeight(
                  _height.toString(),
                );
                final weightError = Validators.validateWeight(
                  _weight.toString(),
                );

                if (heightError != null || weightError != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        heightError ?? weightError ?? "Invalid input",
                      ),
                      backgroundColor: AppColors.obese,
                    ),
                  );
                  return;
                }

                // حساب BMI
                double bmiValue = BMICalculator.calculateBMI(
                  weight: _weight,
                  height: _height,
                );
                String status = BMICalculator.getBMIStatus(bmiValue);

                // اختيار اللون
                Color statusColor;
                switch (status) {
                  case AppStrings.statusUnderweight:
                    statusColor = AppColors.underweight;
                    break;
                  case AppStrings.statusNormal:
                    statusColor = AppColors.normal;
                    break;
                  case AppStrings.statusOverweight:
                    statusColor = AppColors.overweight;
                    break;
                  default:
                    statusColor = AppColors.obese;
                }

                BMIResultModel result = BMIResultModel(
                  bmiValue: bmiValue,
                  status: status,
                  statusColor: statusColor,
                );

                // الانتقال لصفحة النتيجة
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(result: result),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
