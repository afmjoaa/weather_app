import 'package:flutter/material.dart';
import 'package:weather_app/core/weather_routes.dart';

abstract class Application{
  void onCreate();
  void onTerminate();
}

class WeatherApplication extends Application{

  late Map<String, WidgetBuilder> routes;

  @override
  void onCreate() {
    routes = WeatherRoutes.configureRoutes();
  }

  @override
  void onTerminate() {

  }
}