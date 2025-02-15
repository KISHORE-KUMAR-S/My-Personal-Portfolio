import 'package:intl/intl.dart' show DateFormat;

extension DateTimeExtensions on DateTime {
  String toMonthAndYear() {
    final monthFormat = DateFormat("MMMM");
    final yearFormat = DateFormat.y();

    return "${monthFormat.format(this).toUpperCase()} ${yearFormat.format(this)}";
  }
}
