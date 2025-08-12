// ignore_for_file: file_names

class BMICalculator {
  // حساب BMI
  static double calculateBMI({required double weight, required double height}) {
    // الطول بالسنتيمتر يتحول إلى متر
    final heightInMeters = height / 100;
    return weight / (heightInMeters * heightInMeters);
  }

  // تحديد حالة الوزن بناءً على قيمة BMI
  static String getBMIStatus(double bmi) {
    if (bmi < 18.5) {
      return 'Underweight'; // نقص وزن
    } else if (bmi < 25) {
      return 'Normal'; // وزن طبيعي
    } else if (bmi < 30) {
      return 'Overweight'; // زيادة وزن
    } else {
      return 'Obese'; // سمنة
    }
  }
}
