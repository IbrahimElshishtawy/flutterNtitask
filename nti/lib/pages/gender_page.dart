// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:nti/widget/custom_button.dart';
import 'package:nti/widget/gender_card.dart';
import '../core/constants/strings.dart';
import '../core/constants/styles.dart';

typedef GenderSelectedCallback = void Function(String? gender);

class GenderSelectionView extends StatelessWidget {
  final String? selectedGender;
  final GenderSelectedCallback onGenderSelected;
  final VoidCallback onContinuePressed;

  const GenderSelectionView({
    super.key,
    required this.selectedGender,
    required this.onGenderSelected,
    required this.onContinuePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.9), // دارك مود مع شفافية
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.deepPurple.shade900.withOpacity(0.9),
              Colors.black87.withOpacity(0.9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // أيقونة جسم الإنسان مع تدرج لوني
                Container(
                  height: 120,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: selectedGender == AppStrings.male
                          ? [Colors.blue.shade800, Colors.blue.shade300]
                          : selectedGender == AppStrings.female
                          ? [Colors.pink.shade700, Colors.pink.shade300]
                          : [Colors.grey.shade700, Colors.grey.shade500],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    shape: BoxShape.circle,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black54,
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.accessibility_new,
                    size: 90,
                    color: Colors.white.withOpacity(0.9),
                  ),
                ),

                const SizedBox(height: 24),

                Text(
                  AppStrings.appTitle,
                  style: AppStyles.titleStyle.copyWith(
                    fontSize: 32,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    shadows: const [
                      Shadow(
                        color: Colors.black45,
                        offset: Offset(1, 1),
                        blurRadius: 3,
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 8),

                Text(
                  AppStrings.chooseGender,
                  style: AppStyles.subtitleStyle.copyWith(
                    fontSize: 20,
                    color: Colors.white70,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 32),

                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: GenderCard(
                          label: AppStrings.male,
                          imagePath: "assets/man.jpg",
                          isSelected: selectedGender == AppStrings.male,
                          onTap: () => onGenderSelected(AppStrings.male),
                          selectedColor: Colors.blue.shade700,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: GenderCard(
                          label: AppStrings.female,
                          imagePath:
                              "assets/24684754-levantamento-de-peso-mulheres-silhueta-gratis-vetor.jpg",
                          isSelected: selectedGender == AppStrings.female,
                          onTap: () => onGenderSelected(AppStrings.female),
                          selectedColor: Colors.pink.shade400,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 40),

                CustomButton(
                  text: AppStrings.continueText,
                  onPressed: selectedGender != null ? onContinuePressed : null,
                ),

                const SizedBox(height: 16),

                TextButton(
                  onPressed: () => onGenderSelected(null),
                  child: Text(
                    AppStrings.preferNotToChoose,
                    style: AppStyles.subtitleStyle.copyWith(
                      color: Colors.white70,
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
