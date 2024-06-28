// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomeState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() homeInitialState,
    required TResult Function(CurrentWeather currentWeather) dataAvailableState,
    required TResult Function(DataUnavailableReason dataUnavailableReason)
        dataUnavailableState,
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? homeInitialState,
    TResult Function(CurrentWeather currentWeather)? dataAvailableState,
    TResult Function(DataUnavailableReason dataUnavailableReason)?
        dataUnavailableState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc

class _$HomeInitialStateImpl implements HomeInitialState {
  const _$HomeInitialStateImpl();

  @override
  String toString() {
    return 'HomeState.homeInitialState()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$HomeInitialStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() homeInitialState,
    required TResult Function(CurrentWeather currentWeather) dataAvailableState,
    required TResult Function(DataUnavailableReason dataUnavailableReason)
        dataUnavailableState,
  }) {
    return homeInitialState();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? homeInitialState,
    TResult Function(CurrentWeather currentWeather)? dataAvailableState,
    TResult Function(DataUnavailableReason dataUnavailableReason)?
        dataUnavailableState,
    required TResult orElse(),
  }) {
    if (homeInitialState != null) {
      return homeInitialState();
    }
    return orElse();
  }
}

abstract class HomeInitialState implements HomeState {
  const factory HomeInitialState() = _$HomeInitialStateImpl;
}

/// @nodoc

class _$DataAvaiableStateImpl implements DataAvaiableState {
  const _$DataAvaiableStateImpl(this.currentWeather);

  @override
  final CurrentWeather currentWeather;

  @override
  String toString() {
    return 'HomeState.dataAvailableState(currentWeather: $currentWeather)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataAvaiableStateImpl &&
            (identical(other.currentWeather, currentWeather) ||
                other.currentWeather == currentWeather));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currentWeather);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() homeInitialState,
    required TResult Function(CurrentWeather currentWeather) dataAvailableState,
    required TResult Function(DataUnavailableReason dataUnavailableReason)
        dataUnavailableState,
  }) {
    return dataAvailableState(currentWeather);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? homeInitialState,
    TResult Function(CurrentWeather currentWeather)? dataAvailableState,
    TResult Function(DataUnavailableReason dataUnavailableReason)?
        dataUnavailableState,
    required TResult orElse(),
  }) {
    if (dataAvailableState != null) {
      return dataAvailableState(currentWeather);
    }
    return orElse();
  }
}

abstract class DataAvaiableState implements HomeState {
  const factory DataAvaiableState(final CurrentWeather currentWeather) =
      _$DataAvaiableStateImpl;

  CurrentWeather get currentWeather;
}

/// @nodoc

class _$DataUnavailableStateImpl implements DataUnavailableState {
  const _$DataUnavailableStateImpl(this.dataUnavailableReason);

  @override
  final DataUnavailableReason dataUnavailableReason;

  @override
  String toString() {
    return 'HomeState.dataUnavailableState(dataUnavailableReason: $dataUnavailableReason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataUnavailableStateImpl &&
            (identical(other.dataUnavailableReason, dataUnavailableReason) ||
                other.dataUnavailableReason == dataUnavailableReason));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dataUnavailableReason);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() homeInitialState,
    required TResult Function(CurrentWeather currentWeather) dataAvailableState,
    required TResult Function(DataUnavailableReason dataUnavailableReason)
        dataUnavailableState,
  }) {
    return dataUnavailableState(dataUnavailableReason);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? homeInitialState,
    TResult Function(CurrentWeather currentWeather)? dataAvailableState,
    TResult Function(DataUnavailableReason dataUnavailableReason)?
        dataUnavailableState,
    required TResult orElse(),
  }) {
    if (dataUnavailableState != null) {
      return dataUnavailableState(dataUnavailableReason);
    }
    return orElse();
  }
}

abstract class DataUnavailableState implements HomeState {
  const factory DataUnavailableState(
          final DataUnavailableReason dataUnavailableReason) =
      _$DataUnavailableStateImpl;

  DataUnavailableReason get dataUnavailableReason;
}
