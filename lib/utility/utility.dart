import 'package:intl/intl.dart';
import 'package:weather_app/core/weather_inherited_widget.dart';

class Utility {

  static String timeStampToDate(timeStamp) {
    return DateFormat('MM/dd/yyyy').format(
        DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000));
  }

  static String timeStampToTime(timeStamp) {
    return DateFormat('hh:mm a').format(
        DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000));
  }

  static void startLoadingAnimation() {
    WeatherInheritedWidget.loadingCubit.loadingStart();
  }

  static void completeLoadingAnimation() {
    WeatherInheritedWidget.loadingCubit.loadingReset();
  }

  static void showLoadingFailedError(String errorMessage) {
    WeatherInheritedWidget.loadingCubit.loadingFailed(errorMessage);
  }
}