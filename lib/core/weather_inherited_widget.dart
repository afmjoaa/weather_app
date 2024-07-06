import 'package:flutter/cupertino.dart';
import 'package:weather_app/core/weather_application.dart';
import 'package:weather_app/ui/shared/loading/loading_cubit.dart';

class WeatherInheritedWidget extends InheritedWidget {

  final WeatherApplication application;
  static late LoadingCubit loadingCubit;

  const WeatherInheritedWidget(this.application, Widget child, {super.key}): super(child: child);

  @override
  bool updateShouldNotify(_) => true;

  static WeatherInheritedWidget of(BuildContext context) =>
      (context.dependOnInheritedWidgetOfExactType(aspect: WeatherInheritedWidget) as WeatherInheritedWidget);

}