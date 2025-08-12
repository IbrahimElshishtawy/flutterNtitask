import 'package:flutter/material.dart';
import 'package:nti/widget/custom_button.dart';
import 'package:nti/widget/gender_card.dart';
import '../core/constants/strings.dart';
import '../core/constants/styles.dart';

import 'input_page.dart';

class GenderPage extends StatefulWidget {
  const GenderPage({super.key});

  @override
  State<GenderPage> createState() => _GenderPageState();
}

class _GenderPageState extends State<GenderPage> {
  String? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // خلفية متدرجة جميلة
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF2196F3), Color(0xFF90CAF9)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  AppStrings.appTitle,
                  style: AppStyles.titleStyle.copyWith(
                    fontSize: 32,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        color: Colors.black26,
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

                // Gender Cards مع تحسين الظل والحواف الدائرية
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: GenderCard(
                          label: AppStrings.male,
                          imagePath: "assets/man.jpg",
                          isSelected: selectedGender == AppStrings.male,
                          onTap: () {
                            setState(() => selectedGender = AppStrings.male);
                          },
                          // ممكن تعدل الكارد ليقبل لون خلفية عند الاختيار
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
                          onTap: () {
                            setState(() => selectedGender = AppStrings.female);
                          },
                          selectedColor: Colors.pink.shade400,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 40),

                // زر الاستمرار
                CustomButton(
                  text: AppStrings.continueText,
                  onPressed: selectedGender != null
                      ? () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  InputPage(gender: selectedGender!),
                            ),
                          );
                        }
                      : null,

                  // ممكن تضيف لون مميز للزر هنا لو في CustomButton
                ),

                const SizedBox(height: 16),

                // خيار "أفضل عدم الاختيار"
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const InputPage(gender: "Not specified"),
                      ),
                    );
                  },
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
