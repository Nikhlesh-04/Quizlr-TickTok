import 'package:intl/intl.dart';

extension DateExtension on DateTime {
  String formats() {
    return DateFormat.yMMMMd().format(this).toString();
  }

  String convertToDate(String format) {
    return DateFormat(format).format(this);
  }
}
