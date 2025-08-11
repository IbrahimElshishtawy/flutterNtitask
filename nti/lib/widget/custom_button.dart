// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import '../core/constants/styles.dart';
import '../core/constants/colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed; // السماح بـ null

  const CustomButton({
    super.key,
    required this.text,
    this.onPressed, // مش شرط تكون Required دلوقتي
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: onPressed == null
              ? AppColors.primaryBlue.withOpacity(0.5) // لون أفتح عند التعطيل
              : AppColors.primaryBlue,
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: onPressed, // Flutter هيعطل الزر تلقائي لو null
        child: Text(
          text,
          style: AppStyles.buttonTextStyle.copyWith(
            color: onPressed == null
                ? Colors
                      .white70 // نص أفتح لما يكون معطل
                : Colors.white,
          ),
        ),
      ),
    );
  }
}
