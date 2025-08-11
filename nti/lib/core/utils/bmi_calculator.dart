class BMICalculator {
  static double calculateBMI({required double weight, required double height}) {
    double heightInMeters = height / 100; // تحويل من سم إلى متر
    return weight / (heightInMeters * heightInMeters);
  }

  /// تحديد الحالة الصحية حسب قيمة الـ BMI
  static String getBMIStatus(double bmi) {
    if (bmi < 18.5) {
      return "Underweight";
    } else if (bmi >= 18.5 && bmi < 25) {
      return "Normal";
    } else if (bmi >= 25 && bmi < 30) {
      return "Overweight";
    } else {
      return "Obese";
    }
  }

  /// إرجاع اللون المناسب حسب الحالة
  static String getBMIStatusColor(double bmi) {
    if (bmi < 18.5) {
      return "yellow";
    } else if (bmi >= 18.5 && bmi < 25) {
      return "green";
    } else if (bmi >= 25 && bmi < 30) {
      return "orange";
    } else {
      return "red";
    }
  }
}
