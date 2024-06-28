part of 'home_cubit.dart';

enum DataUnavailableReason {
  noInternetAndCache,
  locationPermissionDenied,
  locationDisable,
}

@Freezed(
    copyWith: false,
    map: FreezedMapOptions(map: false, mapOrNull: false, maybeMap: false),
    when: FreezedWhenOptions(when: true, whenOrNull: false, maybeWhen: true)
)
class HomeState with _$HomeState {
  const factory HomeState.homeInitialState() = HomeInitialState;
  const factory HomeState.dataAvailableState(CurrentWeather currentWeather) = DataAvaiableState;
  const factory HomeState.dataUnavailableState(DataUnavailableReason dataUnavailableReason) = DataUnavailableState;
}
