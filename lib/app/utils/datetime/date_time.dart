import 'package:intl/intl.dart';

class DateTimeUtils {
  static String getCurrentDay() {
    final now = DateTime.now();
    return DateFormat('EEEE').format(now);
  }

  static String getCurrentDate() {
    final now = DateTime.now();
    return DateFormat('dd MMMM yyyy').format(now);
  }

  static String getCurrentTime() {
    final now = DateTime.now();
    return DateFormat('HH:mm:ss')
        .format(now); // Menghasilkan waktu dalam format 'HH:mm:ss'
  }
}
