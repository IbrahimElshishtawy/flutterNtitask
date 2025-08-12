// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:nti/core/constants/colors.dart';
import 'package:nti/core/constants/strings.dart';
import 'package:nti/core/constants/styles.dart';
import 'package:nti/widget/custom_button.dart';

class InputView extends StatelessWidget {
  final String gender;
  final double height;
  final double weight;
  final int age;
  final ValueChanged<double> onHeightChanged;
  final ValueChanged<double> onWeightChanged;
  final ValueChanged<int> onAgeChanged;
  final VoidCallback onCalculatePressed;
  final AnimationController animationController;

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
    required this.animationController,
  });

  @override
  Widget build(BuildContext context) {
    final gradientColors = [
      AppColors.primaryBlue.withOpacity(0.6),
      Colors.black.withOpacity(0.7),
    ];

    final animationOffset =
        Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero).animate(
          CurvedAnimation(parent: animationController, curve: Curves.easeOut),
        );

    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.85),

      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: gradientColors,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.primaryBlue.withOpacity(0.5),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: AppBar(
            title: const Text(AppStrings.appTitle),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            foregroundColor: Colors.white,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: SlideTransition(
          position: animationOffset,
          child: FadeTransition(
            opacity: animationController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "${AppStrings.chooseHeightWeight}\n${AppStrings.gender} type: ${gender}",
                  style: AppStyles.titleStyle.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: const [
                      Shadow(
                        color: Colors.black54,
                        offset: Offset(1, 1),
                        blurRadius: 3,
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 30),

                _buildBox(
                  child: Column(
                    children: [
                      Text(
                        "${AppStrings.height}: ${height.toStringAsFixed(1)} cm",
                        style: AppStyles.subtitleStyle.copyWith(
                          fontSize: 20,
                          color: Colors.white70,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      Slider(
                        value: height,
                        min: 100,
                        max: 220,
                        divisions: 120,
                        activeColor: AppColors.primaryBlue,
                        inactiveColor: Colors.white24,
                        label: "${height.toStringAsFixed(1)} cm",
                        onChanged: onHeightChanged,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                _buildBox(
                  child: Column(
                    children: [
                      Text(
                        "${AppStrings.weight}: ${weight.toStringAsFixed(1)} kg",
                        style: AppStyles.subtitleStyle.copyWith(
                          fontSize: 20,
                          color: Colors.white70,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      Slider(
                        value: weight,
                        min: 30,
                        max: 150,
                        divisions: 120,
                        activeColor: AppColors.primaryBlue,
                        inactiveColor: Colors.white24,
                        label: "${weight.toStringAsFixed(1)} kg",
                        onChanged: onWeightChanged,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                _buildBox(
                  child: Column(
                    children: [
                      Text(
                        "Age: $age year",
                        style: AppStyles.subtitleStyle.copyWith(
                          fontSize: 20,
                          color: Colors.white70,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      Slider(
                        value: age.toDouble(),
                        min: 10,
                        max: 100,
                        divisions: 90,
                        activeColor: AppColors.primaryBlue,
                        inactiveColor: Colors.white24,
                        label: '$age',
                        onChanged: (val) => onAgeChanged(val.round()),
                      ),
                    ],
                  ),
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
      ),
    );
  }

  Widget _buildBox({required Widget child}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryBlue.withOpacity(0.4),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: child,
    );
  }
}
