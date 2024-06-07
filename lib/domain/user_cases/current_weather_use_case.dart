import 'package:weather_app/domain/entity/current_weather.dart';
import 'package:weather_app/domain/entity/current_weather_request_dto.dart';
import 'package:weather_app/domain/repository/current_weather_repository.dart';
import 'package:weather_app/domain/user_cases/base_user_case.dart';

class CurrentWeatherUseCase implements BaseUseCase<CurrentWeather?, CurrentWeatherRequestDto> {
  final CurrentWeatherRepository currentWeatherRepository;

  CurrentWeatherUseCase(this.currentWeatherRepository);

  @override
  Future<CurrentWeather?> call(CurrentWeatherRequestDto input) async {
    return await currentWeatherRepository.getCurrentWeather(input.lat, input.lon);
  }
}