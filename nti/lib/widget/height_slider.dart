import 'package:flutter/material.dart';
import '../core/constants/colors.dart';
import '../core/constants/styles.dart';

class HeightSlider extends StatelessWidget {
  final double height;
  final ValueChanged<double> onChanged;

  const HeightSlider({
    super.key,
    required this.height,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Height: ${height.toStringAsFixed(0)} cm",
          style: AppStyles.subtitleStyle,
        ),
        Slider(
          value: height,
          min: 100,
          max: 220,
          divisions: 120,
          activeColor: AppColors.primaryBlue,
          label: "${height.toStringAsFixed(0)} cm",
          onChanged: onChanged,
        ),
      ],
    );
  }
}
