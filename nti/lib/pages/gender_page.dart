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
  late final VoidCallback onPressed; // بدون علامة ?

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.appTitle), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              AppStrings.chooseGender,
              style: AppStyles.titleStyle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),

            // Gender Cards
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: GenderCard(
                      label: AppStrings.male,
                      imagePath: "assets/images/male.png", // حط صورة مناسبة
                      isSelected: selectedGender == AppStrings.male,
                      onTap: () {
                        setState(() => selectedGender = AppStrings.male);
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: GenderCard(
                      label: AppStrings.female,
                      imagePath: "assets/images/female.png", // حط صورة مناسبة
                      isSelected: selectedGender == AppStrings.female,
                      onTap: () {
                        setState(() => selectedGender = AppStrings.female);
                      },
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Continue Button
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
            ),

            const SizedBox(height: 12),

            // Prefer not to choose
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
                style: AppStyles.subtitleStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
