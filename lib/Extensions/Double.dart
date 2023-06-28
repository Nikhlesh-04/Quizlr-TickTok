extension DoubleExtension on double {
  String get rewardString {
    double absBalance = abs();
    if (this < 0) {
      return "-\$$absBalance";
    } else {
      return "\$$absBalance";
    }
  }

  static double getDouble(dynamic value) {
    return value.toDouble() ?? 0.0;
  }
}
