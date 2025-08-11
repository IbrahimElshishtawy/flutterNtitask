import 'package:flutter/material.dart';
import '../core/constants/colors.dart';

class ResultBar extends StatelessWidget {
  final double bmi;

  const ResultBar({super.key, required this.bmi, required double currentBMI});

  @override
  Widget build(BuildContext context) {
    double position;
    if (bmi < 10) {
      position = 0.1;
    } else if (bmi > 40) {
      position = 0.9;
    } else {
      position = (bmi - 10) / 30;
    }

    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        Container(
          height: 20,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.underweight,
                AppColors.normal,
                AppColors.overweight,
                AppColors.obese,
              ],
              stops: [0.25, 0.5, 0.75, 1.0],
            ),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        Positioned(
          left: position * MediaQuery.of(context).size.width * 0.8,
          child: Container(width: 4, height: 25, color: Colors.black),
        ),
      ],
    );
  }
}
