import 'package:flutter/material.dart';
import 'package:weather_app/core/weather_application.dart';
import 'package:weather_app/core/weather_inherited_widget.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  WeatherApplication application = WeatherApplication();
  application.onCreate();
  runApp(WeatherApp(weatherApplication: application,));
}

class WeatherApp extends StatelessWidget {
  final WeatherApplication weatherApplication;

  const WeatherApp({super.key, required this.weatherApplication});

  @override
  Widget build(BuildContext context) {
    final app = MaterialApp(
      title: "Weather App",
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue.shade100,
            foregroundColor: Colors.grey.shade900,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
        appBarTheme: const AppBarTheme(
          color: Color.fromARGB(255, 117, 208, 247),
        ),
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.light,
          seedColor: const Color(0xFF13B9FF),
        ),
        snackBarTheme: const SnackBarThemeData(
          behavior: SnackBarBehavior.floating,
        ),
        fontFamily: 'MohrRounded',
      ),
      routes: weatherApplication.routes,
      debugShowCheckedModeBanner: false,
    );

    final WeatherInheritedWidget inheritedWidget = WeatherInheritedWidget(weatherApplication, app);
    return inheritedWidget;
  }
}

