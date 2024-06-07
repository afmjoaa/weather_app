import 'package:flutter/cupertino.dart';
import 'package:weather_app/core/weather_application.dart';

class WeatherInheritedWidget extends InheritedWidget {

  final WeatherApplication application;

  const WeatherInheritedWidget(this.application, Widget child, {super.key}): super(child: child);

  @override
  bool updateShouldNotify(_) => true;

  static WeatherInheritedWidget of(BuildContext context) =>
      (context.dependOnInheritedWidgetOfExactType(aspect: WeatherInheritedWidget) as WeatherInheritedWidget);

}