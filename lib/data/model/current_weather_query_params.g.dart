// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_weather_query_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CurrentWeatherQueryParamsImpl _$$CurrentWeatherQueryParamsImplFromJson(
        Map<String, dynamic> json) =>
    _$CurrentWeatherQueryParamsImpl(
      (json['lat'] as num).toDouble(),
      (json['lon'] as num).toDouble(),
      json['appId'] as String,
      json['units'] as String,
    );

Map<String, dynamic> _$$CurrentWeatherQueryParamsImplToJson(
        _$CurrentWeatherQueryParamsImpl instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lon': instance.lon,
      'appId': instance.appId,
      'units': instance.units,
    };
