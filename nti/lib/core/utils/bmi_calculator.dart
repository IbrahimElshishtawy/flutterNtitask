import 'package:flutter/material.dart';

class BMRCalculatorPage extends StatefulWidget {
  const BMRCalculatorPage({Key? key}) : super(key: key);

  @override
  State<BMRCalculatorPage> createState() => _BMRCalculatorPageState();
}

class _BMRCalculatorPageState extends State<BMRCalculatorPage> {
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  String _gender = 'male'; // افتراضي ذكر
  double? _bmrResult;

  // دالة حساب BMR
  double calculateBMR({
    required double weightKg,
    required double heightCm,
    required int age,
    required String gender,
  }) {
    if (gender.toLowerCase() == 'male') {
      return 88.362 + (13.397 * weightKg) + (4.799 * heightCm) - (5.677 * age);
    } else {
      return 447.593 + (9.247 * weightKg) + (3.098 * heightCm) - (4.330 * age);
    }
  }

  void _calculate() {
    final double? weight = double.tryParse(_weightController.text);
    final double? height = double.tryParse(_heightController.text);
    final int? age = int.tryParse(_ageController.text);

    if (weight == null || height == null || age == null) {
      // عرض رسالة خطأ إذا المدخلات غير صحيحة
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('يرجى إدخال قيم صحيحة')));
      return;
    }

    final double result = calculateBMR(
      weightKg: weight,
      heightCm: height,
      age: age,
      gender: _gender,
    );

    setState(() {
      _bmrResult = result;
    });
  }

  @override
  void dispose() {
    _weightController.dispose();
    _heightController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('حاسبة السعرات الحرارية')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // الوزن
            TextField(
              controller: _weightController,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: const InputDecoration(
                labelText: 'الوزن (كجم)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            // الطول
            TextField(
              controller: _heightController,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: const InputDecoration(
                labelText: 'الطول (سم)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            // العمر
            TextField(
              controller: _ageController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'العمر (سنوات)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            // اختيار الجنس
            Row(
              children: [
                Expanded(
                  child: RadioListTile<String>(
                    title: const Text('ذكر'),
                    value: 'male',
                    groupValue: _gender,
                    onChanged: (value) {
                      setState(() {
                        _gender = value!;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile<String>(
                    title: const Text('أنثى'),
                    value: 'female',
                    groupValue: _gender,
                    onChanged: (value) {
                      setState(() {
                        _gender = value!;
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            // زر الحساب
            ElevatedButton(
              onPressed: _calculate,
              child: const Text('احسب السعرات الحرارية'),
            ),
            const SizedBox(height: 32),

            // عرض النتيجة
            if (_bmrResult != null)
              Text(
                'السعرات الحرارية المحتملة لجسمك يوميًا:\n${_bmrResult!.toStringAsFixed(1)} سعر حراري',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
                textAlign: TextAlign.center,
              ),
          ],
        ),
      ),
    );
  }
}
