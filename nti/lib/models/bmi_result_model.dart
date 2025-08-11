import 'package:flutter/material.dart';

class BMIResultModel {
  final double bmiValue; // قيمة BMI
  final String status; // الحالة (Normal, Overweight...)
  final Color statusColor; // اللون المناسب للحالة

  BMIResultModel({
    required this.bmiValue,
    required this.status,
    required this.statusColor,
  });

  /// تحويل البيانات إلى نص (Debugging)
  @override
  String toString() {
    return "BMI: $bmiValue, Status: $status, Color: $statusColor";
  }
}
