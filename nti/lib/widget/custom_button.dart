import 'package:flutter/material.dart';
import '../core/constants/styles.dart';
import '../core/constants/colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed; // السماح بأن يكون null لتعطيل الزر
  final Color buttonColor;
  final TextStyle? textStyle;

  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    this.buttonColor = AppColors.primaryBlue,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDisabled = onPressed == null;

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isDisabled
              ? buttonColor.withOpacity(0.5)
              : buttonColor,
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: isDisabled ? 0 : 4,
          shadowColor: isDisabled ? Colors.transparent : Colors.black45,
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style:
              textStyle ??
              AppStyles.buttonTextStyle.copyWith(
                color: isDisabled ? Colors.white70 : Colors.white,
              ),
        ),
      ),
    );
  }
}
