import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app/data/respository/current_weather_repository_implementation.dart';
import 'package:weather_app/domain/entity/current_weather.dart';
import 'package:weather_app/domain/entity/current_weather_request_dto.dart';
import 'package:weather_app/domain/user_cases/current_weather_use_case.dart';
import 'package:geolocator/geolocator.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState.homeInitialState());

  Future<void> getCurrentWeather() async {

    LocationPermission permission = await Geolocator.requestPermission();
    if(permission == LocationPermission.unableToDetermine) {
      permission = await Geolocator.checkPermission();
    } else if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever){
      if (Platform.isAndroid || Platform.isIOS) {
        emit(const DataUnavailableState(DataUnavailableReason.locationPermissionDenied));
      }
    } else {
      bool isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!isLocationServiceEnabled) {
        if (Platform.isAndroid || Platform.isIOS) {
          emit(const DataUnavailableState(DataUnavailableReason.locationPermissionDenied));
        }
      }else{
        Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
        var currentWeather = await CurrentWeatherUseCase(CurrentWeatherRepositoryImplementation()).call(
          CurrentWeatherRequestDto(position.latitude, position.longitude)
        );
        if(currentWeather == null) {
          emit(const HomeState.dataUnavailableState(DataUnavailableReason.noInternetAndCache));
        }else {
          emit(DataAvaiableState(currentWeather));
        }
      }
    }
  }
}
