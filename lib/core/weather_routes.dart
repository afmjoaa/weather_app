import 'package:flutter/cupertino.dart';
import 'package:weather_app/ui/screen/about/about_screen.dart';
import 'package:weather_app/ui/screen/home/home_screen.dart';

class WeatherRoutes {
  static Map<String, WidgetBuilder> configureRoutes() {
    return {
        HomeScreen.path: (context) => const HomeScreen(),
        AboutScreen.path: (context) => const AboutScreen(),
    };
  }
}