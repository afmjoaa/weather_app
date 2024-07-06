import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:weather_app/data/storage/hive_storage.dart';
import 'package:weather_app/domain/entity/current_weather.dart';
import 'package:weather_app/domain/entity/weather_element_dto.dart';
import 'package:weather_app/ui/screen/home/cubit/home_cubit.dart';
import 'package:weather_app/ui/screen/home/widgets/city_info_widget.dart';
import 'package:weather_app/ui/screen/home/widgets/comfort_level_widget.dart';
import 'package:weather_app/ui/screen/home/widgets/data_unavailable_widget.dart';
import 'package:weather_app/ui/screen/home/widgets/sunrise_and_sunset_widget.dart';
import 'package:weather_app/ui/screen/home/widgets/weather_element_widget.dart';
import 'package:weather_app/ui/screen/home/widgets/weather_info_widget.dart';
import 'package:weather_app/ui/screen/home/widgets/wind_widget.dart';
import 'package:weather_app/ui/shared/common_appbar.dart';

class DashBoardWidget extends StatefulWidget {
  final ZoomDrawerController zoomDrawerController;

  const DashBoardWidget({super.key, required this.zoomDrawerController});

  @override
  State<DashBoardWidget> createState() => _DashBoardWidgetState();
}

class _DashBoardWidgetState extends State<DashBoardWidget> {
  late final HomeCubit _homeCubit;
  late Future<void> _hiveInit;

  @override
  void initState() {
    super.initState();
    _homeCubit = HomeCubit();
    _hiveInit = HiveStorage.init();
    _hiveInit.whenComplete(_homeCubit.getCurrentWeather);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppbar(
        onTapCallback: () => widget.zoomDrawerController.toggle?.call(),
        assetLocation: 'asset/icons/menu.svg',
        title: '',
      ),
      body: ListView(
        children: [
          BlocProvider.value(
              value: _homeCubit,
            child: BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state){
                return state.when(
                    homeInitialState: () => Container(),
                    dataAvailableState: (CurrentWeather currentWeather) => _getWeatherView(currentWeather),
                    dataUnavailableState: (DataUnavailableReason dataUnavailableReason) =>
                  DataUnavailableWidget(dataUnavailableReason: dataUnavailableReason,),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _homeCubit.close();
    HiveStorage.clear();
    super.dispose();
  }

  Widget _getWeatherView(CurrentWeather currentWeather) {
    return Column(
      children: [
        CityInfoWidget(date: currentWeather.dt, city: '${currentWeather.name} ${currentWeather.sys.country}',),
        WeatherInfoWidget(
          temp: currentWeather.main.temp.toString(),
          weatherDes: currentWeather.weather[0].description,
          iconUrl: 'http://openweathermap.org/img/wn/${currentWeather.weather[0].icon}@2x.png',
        ),
        WeatherElementWidget([
          WeatherElementDto('asset/icons/ventos.svg', '${currentWeather.wind.speed} m/s'),
          WeatherElementDto('asset/icons/nuvem.svg', '${currentWeather.clouds.all} %'),
          WeatherElementDto('asset/icons/umidade.svg', '${currentWeather.rain.onehr} mm/hr' )
        ]),
        SunriseAndSunsetWidget(sunRise: currentWeather.sys.sunrise, sunSet: currentWeather.sys.sunset,),
        ComfortLevelWidget(humidity: currentWeather.main.humidity, feelsLike: currentWeather.main.feelsLike, pressure: currentWeather.main.pressure,),
        WindWidget(visibility: currentWeather.visibility, windDir: currentWeather.wind.deg,)
      ],
    );
  }
}
