import 'package:intl/intl.dart';

class Utility {

  static String timeStampToDate(timeStamp) {
    return DateFormat('MM/dd/yyyy').format(
        DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000));
  }

  static String timeStampToTime(timeStamp) {
    return DateFormat('hh:mm a').format(
        DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000));
  }
}