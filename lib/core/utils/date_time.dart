import 'package:intl/intl.dart';

class AppDateTime {
  static String formatDateTypeWeekDay(DateTime? date) {
    if(date != null){
      return DateFormat('EEEE, M/d/y').format(date);
    } else {
      return '';
    }
  }
}
