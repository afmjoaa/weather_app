import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:weather_app/data/storage/hive_storage.dart';
import 'package:weather_app/domain/entity/current_weather.dart';
import 'package:weather_app/ui/screen/home/cubit/home_cubit.dart';
import 'package:weather_app/ui/screen/home/widgets/data_unavailable_widget.dart';
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
    return Placeholder();
  }
}
