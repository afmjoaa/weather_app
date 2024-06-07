import 'package:dartz/dartz.dart';
import 'package:weather_app/data/model/current_weather_response.dart';
import 'package:weather_app/data/model/error_response.dart';
import 'package:weather_app/data/respository/data_source/current_weather_local_data_source.dart';
import 'package:weather_app/domain/entity/current_weather.dart';
import 'package:weather_app/domain/repository/current_weather_repository.dart';

import 'data_source/current_weather_remote_data_source.dart';

class CurrentWeatherRepositoryImplementation
    implements CurrentWeatherRepository {
  late CurrentWeatherLocalDataSource currentWeatherLocalDataSource;
  late CurrentWeatherRemoteDataSource currentWeatherRemoteDataSource;

  CurrentWeatherRepositoryImplementation() {
    currentWeatherLocalDataSource =
        CurrentWeatherLocalDataSourceImplementation();
    currentWeatherRemoteDataSource =
        CurrentWeatherRemoteDataSourceImplementation();
  }

  @override
  Future<CurrentWeather?> getCurrentWeather(double lat, double lon) async {
    Either<CurrentWeatherResponse, ErrorResponse> response =
        await currentWeatherRemoteDataSource.getCurrentWeather(lat, lon);

    var result = response.fold(
      (CurrentWeatherResponse currentWeatherResponse) async {
        currentWeatherLocalDataSource
            .putCurrentWeatherResponse(currentWeatherResponse);
        return currentWeatherResponse.toEntity();
      },
      (ErrorResponse error) async {
        CurrentWeatherResponse? localData =
            await currentWeatherLocalDataSource.getCurrentWeatherResponse();
        if (localData != null) {
          return localData.toEntity();
        }
        return null;
      },
    );

    return result;
  }
}
