import 'package:weather_app/domain/entity/current_weather.dart';

abstract class CurrentWeatherRepository {
  Future<CurrentWeather?> getCurrentWeather(
      double lat,
      double lan,
      );
}