// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:nti/core/constants/colors.dart';
import 'package:nti/core/constants/strings.dart';
import 'package:nti/core/constants/styles.dart';
import 'package:nti/core/utils/validators.dart';
import 'package:nti/models/BMI_Calculator.dart';
import 'package:nti/models/bmi_result_model.dart';
import 'package:nti/pages/result_page.dart';
import 'package:nti/widget/custom_button.dart';
import 'package:nti/widget/height_slider.dart';
import 'package:nti/widget/weight_slider.dart';

class InputPage extends StatefulWidget {
  final String gender;
  const InputPage({super.key, required this.gender});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  double _height = 170;
  double _weight = 65;
  int _age = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // نخلي الخلفية داكنة مع شفافية خفيفة
      backgroundColor: Colors.black.withOpacity(0.85),

      appBar: AppBar(
        title: const Text(AppStrings.appTitle),
        centerTitle: true,
        elevation: 4,
        backgroundColor: AppColors.primaryBlue,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(
              0.05,
            ), // شفافية خفيفة لخلفية المحتوى
            borderRadius: BorderRadius.circular(15),
          ),
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "${AppStrings.chooseHeightWeight}\nGender: ${widget.gender}",
                style: AppStyles.titleStyle.copyWith(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      color: Colors.black45,
                      offset: Offset(1, 1),
                      blurRadius: 2,
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),

              // Height Section
              Text(
                "${AppStrings.height}: ${_height.toStringAsFixed(1)} cm",
                style: AppStyles.subtitleStyle.copyWith(
                  fontSize: 20,
                  color: Colors.white70,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              HeightSlider(
                height: _height,
                onChanged: (value) {
                  setState(() {
                    _height = value;
                  });
                },
              ),
              const SizedBox(height: 30),

              // Weight Section
              Text(
                "${AppStrings.weight}: ${_weight.toStringAsFixed(1)} kg",
                style: AppStyles.subtitleStyle.copyWith(
                  fontSize: 20,
                  color: Colors.white70,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              WeightSlider(
                weight: _weight,
                onChanged: (value) {
                  setState(() {
                    _weight = value;
                  });
                },
              ),
              const SizedBox(height: 30),

              // Age Section
              Text(
                "العمر: $_age سنة",
                style: AppStyles.subtitleStyle.copyWith(
                  fontSize: 20,
                  color: Colors.white70,
                ),
                textAlign: TextAlign.center,
              ),
              Slider(
                value: _age.toDouble(),
                min: 10,
                max: 100,
                divisions: 90,
                activeColor: AppColors.primaryBlue,
                inactiveColor: Colors.white24,
                label: '$_age',
                onChanged: (double value) {
                  setState(() {
                    _age = value.round();
                  });
                },
              ),

              const SizedBox(height: 40),

              // Calculate BMI Button
              CustomButton(
                text: AppStrings.calculateBMI,
                onPressed: () {
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
                        behavior: SnackBarBehavior.floating,
                        margin: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                      ),
                    );
                    return;
                  }

                  double bmiValue = BMICalculator.calculateBMI(
                    weight: _weight,
                    height: _height,
                  );
                  String status = BMICalculator.getBMIStatus(bmiValue);

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
                    // لو عايز تضيف BMR هنا ممكن تضيف حقل جديد في BMIResultModel
                  );

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
      ),
    );
  }
}
