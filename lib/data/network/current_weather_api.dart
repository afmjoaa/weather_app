
import 'package:weather_app/data/api_provider/weather_api_provider.dart';
import 'package:weather_app/data/model/base_model.dart';
import 'package:weather_app/data/model/current_weather_query_params.dart';
import 'package:weather_app/data/model/current_weather_response.dart';
import 'package:weather_app/data/model/error_response.dart';
import 'package:weather_app/data/network/base_api.dart';

class CurrentWeatherApi extends BaseApi<CurrentWeatherQueryParams, CurrentWeatherResponse, ErrorResponse> {
  CurrentWeatherApi(): super("weather", WeatherApiProvider());

  @override
  BaseModel mapErrorResponse(Map<String, dynamic>? errorJson) {
    return ErrorResponse.fromJson(errorJson!);
  }

  @override
  BaseModel mapSuccessResponse(Map<String, dynamic>? responseJson) {
    return CurrentWeatherResponse.fromJson(responseJson!);
  }
}