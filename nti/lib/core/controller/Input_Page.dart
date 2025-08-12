// ignore_for_file: use_super_parameters

import 'package:flutter/material.dart';
import 'package:nti/core/constants/colors.dart';
import 'package:nti/core/constants/strings.dart';
import 'package:nti/core/controller/Result_Page.dart';
import 'package:nti/core/utils/validators.dart';
import 'package:nti/models/BMI_Calculator.dart';
import 'package:nti/models/bmi_result_model.dart';
import 'package:nti/pages/input_page.dart';

class InputPage extends StatefulWidget {
  final String gender;
  const InputPage({Key? key, required this.gender}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage>
    with SingleTickerProviderStateMixin {
  double _height = 170;
  double _weight = 65;
  int _age = 25;

  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    // تحكم الأنيميشن
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onHeightChanged(double value) {
    setState(() {
      _height = value;
    });
  }

  void _onWeightChanged(double value) {
    setState(() {
      _weight = value;
    });
  }

  void _onAgeChanged(int value) {
    setState(() {
      _age = value;
    });
  }

  void _onCalculatePressed() {
    final heightError = Validators.validateHeight(_height.toString());
    final weightError = Validators.validateWeight(_weight.toString());

    if (heightError != null || weightError != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(heightError ?? weightError ?? "Invalid input"),
          backgroundColor: AppColors.obese,
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        ),
      );
      return;
    }

    double bmiValue = BMICalculator.calculateBMI(
      weight: _weight,
      height: _height,
    );

    String status = BMICalculator.getBMIStatus(bmiValue);

    Color statusColor;
    switch (status) {
      case AppStrings.statusUnderweight:
        statusColor = AppColors.underweight;
        break;
      case AppStrings.statusNormal:
        statusColor = AppColors.normal;
        break;
      case AppStrings.statusOverweight:
        statusColor = AppColors.overweight;
        break;
      default:
        statusColor = AppColors.obese;
    }

    BMIResultModel result = BMIResultModel(
      bmiValue: bmiValue,
      status: status,
      statusColor: statusColor,
    );

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ResultPage(result: result)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InputView(
      gender: widget.gender,
      height: _height,
      weight: _weight,
      age: _age,
      onHeightChanged: _onHeightChanged,
      onWeightChanged: _onWeightChanged,
      onAgeChanged: _onAgeChanged,
      onCalculatePressed: _onCalculatePressed,
      animationController: _animationController,
    );
  }
}
