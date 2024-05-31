import 'package:dio/dio.dart';

abstract class BaseApiProvider{
  late Dio dio;

  static const Duration connectTimeOut = Duration(seconds: 30);
  static const Duration receiveTimeOut = Duration(seconds: 30);
}