// ignore_for_file: file_names, unused_import

import 'package:flutter/material.dart';
import 'package:nti/core/controller/Input_Page.dart';
import 'package:nti/core/controller/input_page.dart' hide InputPage;

import 'package:nti/pages/gender_page.dart';

class GenderPage extends StatefulWidget {
  const GenderPage({super.key});

  @override
  State<GenderPage> createState() => _GenderPageState();
}

class _GenderPageState extends State<GenderPage> {
  String? selectedGender;

  void onGenderSelected(String? gender) {
    setState(() {
      selectedGender = gender;
    });
    if (gender == null) {
      // لو فضل عدم الاختيار، نفتح الصفحة مع "Not specified"
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const InputPage(gender: "Not specified"),
        ),
      );
    }
  }

  void onContinuePressed() {
    if (selectedGender != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => InputPage(gender: selectedGender!),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GenderSelectionView(
      selectedGender: selectedGender,
      onGenderSelected: onGenderSelected,
      onContinuePressed: onContinuePressed,
    );
  }
}
