// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'current_weather_query_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CurrentWeatherQueryParams _$CurrentWeatherQueryParamsFromJson(
    Map<String, dynamic> json) {
  return _CurrentWeatherQueryParams.fromJson(json);
}

/// @nodoc
mixin _$CurrentWeatherQueryParams {
  double get lat => throw _privateConstructorUsedError;
  double get lon => throw _privateConstructorUsedError;
  String get appId => throw _privateConstructorUsedError;
  String get units => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable()
class _$CurrentWeatherQueryParamsImpl implements _CurrentWeatherQueryParams {
  const _$CurrentWeatherQueryParamsImpl(
      this.lat, this.lon, this.appId, this.units);

  factory _$CurrentWeatherQueryParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$CurrentWeatherQueryParamsImplFromJson(json);

  @override
  final double lat;
  @override
  final double lon;
  @override
  final String appId;
  @override
  final String units;

  @override
  Map<String, dynamic> toJson() {
    return _$$CurrentWeatherQueryParamsImplToJson(
      this,
    );
  }
}

abstract class _CurrentWeatherQueryParams implements CurrentWeatherQueryParams {
  const factory _CurrentWeatherQueryParams(final double lat, final double lon,
      final String appId, final String units) = _$CurrentWeatherQueryParamsImpl;

  factory _CurrentWeatherQueryParams.fromJson(Map<String, dynamic> json) =
      _$CurrentWeatherQueryParamsImpl.fromJson;

  @override
  double get lat;
  @override
  double get lon;
  @override
  String get appId;
  @override
  String get units;
}
