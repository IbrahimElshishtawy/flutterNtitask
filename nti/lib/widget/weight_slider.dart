import 'package:flutter/material.dart';
import '../core/constants/colors.dart';
import '../core/constants/styles.dart';

class WeightSlider extends StatelessWidget {
  final double weight;
  final ValueChanged<double> onChanged;

  const WeightSlider({
    super.key,
    required this.weight,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Weight: ${weight.toStringAsFixed(0)} kg",
          style: AppStyles.subtitleStyle,
        ),
        Slider(
          value: weight,
          min: 30,
          max: 150,
          divisions: 120,
          activeColor: AppColors.primaryBlue,
          label: "${weight.toStringAsFixed(0)} kg",
          onChanged: onChanged,
        ),
      ],
    );
  }
}
