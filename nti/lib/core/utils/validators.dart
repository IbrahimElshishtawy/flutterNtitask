class Validators {
  /// التحقق من أن الرقم أكبر من صفر
  static String? validatePositiveNumber(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return "$fieldName cannot be empty";
    }
    final number = double.tryParse(value);
    if (number == null || number <= 0) {
      return "$fieldName must be greater than zero";
    }
    return null;
  }

  /// التحقق من الوزن
  static String? validateWeight(String? value) {
    return validatePositiveNumber(value, "Weight");
  }

  /// التحقق من الطول
  static String? validateHeight(String? value) {
    return validatePositiveNumber(value, "Height");
  }
}
