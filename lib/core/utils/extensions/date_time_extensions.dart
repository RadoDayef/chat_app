import 'package:flutter_numkit/flutter_numkit.dart';
import 'package:intl/intl.dart';

extension DateTimeExtensions on DateTime {
  String get formateChatTime {
    final now = DateTime.now();
    final yearStart = DateTime(now.year);
    final todayStart = DateTime(now.year, now.month, now.day);
    final yesterdayStart = todayStart.subtract(1.days);
    if (isAfter(todayStart)) {
      return DateFormat("hh:mm").format(this);
    } else if (isAfter(yesterdayStart)) {
      return "Yesterday";
    } else if (isAfter(yearStart)) {
      return "MM/dd";
    } else {
      return DateFormat("yyyy/MM/dd").format(this);
    }
  }
}
