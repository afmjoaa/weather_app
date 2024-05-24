import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app/data/base_model.dart';

part 'current_weather_query_params.freezed.dart';
part 'current_weather_query_params.g.dart';

@Freezed(
  copyWith: false,
  equal: false,
  toStringOverride: false,
)
class CurrentWeatherQueryParams extends BaseModel<CurrentWeatherQueryParams> with _$CurrentWeatherQueryParams {
  const factory CurrentWeatherQueryParams(
      double lat,
      double lon,
      String appId,
      String units,
      ) = _CurrentWeatherQueryParams;

  factory CurrentWeatherQueryParams.fromJson(Map<String, dynamic> json) =>
      _$CurrentWeatherQueryParamsFromJson(json);
}