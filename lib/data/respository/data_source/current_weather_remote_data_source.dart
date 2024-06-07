import 'package:dartz/dartz.dart';
import 'package:weather_app/data/model/current_weather_query_params.dart';
import 'package:weather_app/data/model/current_weather_response.dart';
import 'package:weather_app/data/model/error_response.dart';
import 'package:weather_app/data/network/current_weather_api.dart';

abstract class CurrentWeatherRemoteDataSource {
  Future<Either<CurrentWeatherResponse, ErrorResponse>> getCurrentWeather(
    double lat,
    double lon,
  );
}

class CurrentWeatherRemoteDataSourceImplementation
    implements CurrentWeatherRemoteDataSource {
  late CurrentWeatherApi currentWeatherApi;

  CurrentWeatherRemoteDataSourceImplementation() {
    currentWeatherApi = CurrentWeatherApi();
  }

  @override
  Future<Either<CurrentWeatherResponse, ErrorResponse>> getCurrentWeather(
      double lat, double lon) async {
    Either<CurrentWeatherResponse, ErrorResponse> response =
        await currentWeatherApi.get(
            queryParams:
                CurrentWeatherQueryParams(lat, lon, '0a1ce7426b8c585644f5e8265187d455', 'metric').toJson());
    return response;
  }
}
