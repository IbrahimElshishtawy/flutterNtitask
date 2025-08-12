import 'package:flutter/material.dart';
import 'package:nti/core/constants/colors.dart';
import 'package:nti/core/constants/strings.dart';
import 'package:nti/core/constants/styles.dart';
import 'package:nti/widget/custom_button.dart';
import 'package:nti/widget/height_slider.dart';
import 'package:nti/widget/weight_slider.dart';

typedef OnCalculateCallback =
    void Function({
      required double height,
      required double weight,
      required int age,
    });

class InputView extends StatelessWidget {
  final String gender;
  final double height;
  final double weight;
  final int age;
  final ValueChanged<double> onHeightChanged;
  final ValueChanged<double> onWeightChanged;
  final ValueChanged<int> onAgeChanged;
  final VoidCallback onCalculatePressed;

  const InputView({
    super.key,
    required this.gender,
    required this.height,
    required this.weight,
    required this.age,
    required this.onHeightChanged,
    required this.onWeightChanged,
    required this.onAgeChanged,
    required this.onCalculatePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            color: Colors.white.withOpacity(0.05),
            borderRadius: BorderRadius.circular(15),
          ),
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "${AppStrings.chooseHeightWeight}\nGender: $gender",
                style: AppStyles.titleStyle.copyWith(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: const [
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

              Text(
                "${AppStrings.height}: ${height.toStringAsFixed(1)} cm",
                style: AppStyles.subtitleStyle.copyWith(
                  fontSize: 20,
                  color: Colors.white70,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 10),

              HeightSlider(height: height, onChanged: onHeightChanged),

              const SizedBox(height: 30),

              Text(
                "${AppStrings.weight}: ${weight.toStringAsFixed(1)} kg",
                style: AppStyles.subtitleStyle.copyWith(
                  fontSize: 20,
                  color: Colors.white70,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 10),

              WeightSlider(weight: weight, onChanged: onWeightChanged),

              const SizedBox(height: 30),

              Text(
                "العمر: $age سنة",
                style: AppStyles.subtitleStyle.copyWith(
                  fontSize: 20,
                  color: Colors.white70,
                ),
                textAlign: TextAlign.center,
              ),

              Slider(
                value: age.toDouble(),
                min: 10,
                max: 100,
                divisions: 90,
                activeColor: AppColors.primaryBlue,
                inactiveColor: Colors.white24,
                label: '$age',
                onChanged: (value) => onAgeChanged(value.round()),
              ),

              const SizedBox(height: 40),

              CustomButton(
                text: AppStrings.calculateBMI,
                onPressed: onCalculatePressed,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
