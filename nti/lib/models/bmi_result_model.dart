import 'package:flutter/material.dart';

class BMIResultModel {
  final double bmiValue;
  final String status;
  final Color statusColor;
  final double? bmrValue; // إضافة قيمة BMR (اختياري)

  BMIResultModel({
    required this.bmiValue,
    required this.status,
    required this.statusColor,
    this.bmrValue,
  });
}
