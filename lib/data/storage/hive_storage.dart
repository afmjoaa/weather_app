
import 'dart:io';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:weather_app/data/model/current_weather_response.dart';
import 'package:weather_app/data/storage/hive_type_ids.dart';


class HiveStorage {
  static final HiveStorage _instance = HiveStorage._();

  factory HiveStorage() {
    return _instance;
  }

  HiveStorage._();

  static Future<void> init() async {
    await _initHiveAdapters();
  }

  static _initHiveAdapters() async {
    Directory directory = await getApplicationDocumentsDirectory();

    Hive.init(directory.path + '/weather');

    if (!Hive.isAdapterRegistered(HiveTypeIds.currentWeatherResponse)) Hive.registerAdapter(CurrentWeatherResponseAdapter());
    if (!Hive.isAdapterRegistered(HiveTypeIds.coordResponseModel)) Hive.registerAdapter(CoordResponseModelAdapter());
    if (!Hive.isAdapterRegistered(HiveTypeIds.weatherResponseModel)) Hive.registerAdapter(WeatherResponseModelAdapter());
    if (!Hive.isAdapterRegistered(HiveTypeIds.mainResponseModel)) Hive.registerAdapter(MainResponseModelAdapter());
    if (!Hive.isAdapterRegistered(HiveTypeIds.windResponseModel)) Hive.registerAdapter(WindResponseModelAdapter());
    if (!Hive.isAdapterRegistered(HiveTypeIds.cloudsResponseModel)) Hive.registerAdapter(CloudsResponseModelAdapter());
    if (!Hive.isAdapterRegistered(HiveTypeIds.sysResponseModel)) Hive.registerAdapter(SysResponseModelAdapter());
    if (!Hive.isAdapterRegistered(HiveTypeIds.rainResponseModel)) Hive.registerAdapter(RainResponseModelAdapter());
  }

  static void clear() async {
    await Hive.close();
  }
}