extension IntExtension on int {
  String get ordinal {
    if (!(this >= 1 && this <= 100)) {
      //here you change the range
      throw Exception('Invalid number');
    }

    if (this >= 11 && this <= 13) {
      return '${toString()}th';
    }

    switch (this % 10) {
      case 1:
        return '${toString()}st';
      case 2:
        return '${toString()}nd';
      case 3:
        return '${toString()}rd';
      default:
        return '${toString()}th';
    }
  }
}
