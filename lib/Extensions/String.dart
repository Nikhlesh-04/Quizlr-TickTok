import 'package:intl/intl.dart';

extension StringExtension on String {
  DateTime? convertToDate(String formatType) {
    return DateFormat(formatType).parse(this);
  }
}
