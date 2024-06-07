import 'package:hive/hive.dart';
import 'package:weather_app/data/model/current_weather_response.dart';

abstract class CurrentWeatherLocalDataSource {
  Future<CurrentWeatherResponse?> getCurrentWeatherResponse();
  Future<void> putCurrentWeatherResponse(CurrentWeatherResponse currentWeatherResponse);
}

class CurrentWeatherLocalDataSourceImplementation implements CurrentWeatherLocalDataSource {
  final String _currentWeatherResponseKey = 'currentWeatherResponseKey';

  Future<Box<CurrentWeatherResponse>> _getCurrentWeatherResponseBox() async {
    return await Hive.openBox<CurrentWeatherResponse>("currentWeatherResponse");
  }

  @override
  Future<CurrentWeatherResponse?> getCurrentWeatherResponse() async {
    Box<CurrentWeatherResponse> box = await _getCurrentWeatherResponseBox();
    CurrentWeatherResponse? currentWeatherResponse = box.get(_currentWeatherResponseKey);
    await box.close();
    return currentWeatherResponse;
  }

  @override
  Future<void> putCurrentWeatherResponse(CurrentWeatherResponse currentWeatherResponse) async {
    Box<CurrentWeatherResponse> box = await _getCurrentWeatherResponseBox();
    await box.put(_currentWeatherResponseKey, currentWeatherResponse);
    await box.flush();
    await box.close();
  }
}