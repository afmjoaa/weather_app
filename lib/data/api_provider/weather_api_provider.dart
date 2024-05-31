import 'package:dio/dio.dart';
import 'package:weather_app/data/api_provider/base_api_provider.dart';

class WeatherApiProvider extends BaseApiProvider{

  WeatherApiProvider(){
    BaseOptions options = createBaseOptions();
    dio = Dio(options);
    dio.interceptors.add(logInterceptor);
    dio.interceptors.add(getLoadingInterceptor());
  }

  Interceptor logInterceptor = LogInterceptor(responseBody: true, requestBody: true, requestHeader: true);

  Interceptor getLoadingInterceptor() {
    return InterceptorsWrapper(
      onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
        //Todo
        handler.next(options);
      },
      onResponse: (Response<dynamic> response, ResponseInterceptorHandler handler,){
        //Todo
        handler.next(response);
      },
      onError:  (DioException error, ErrorInterceptorHandler handler,) {
        //Todo
        handler.next(error);
      }
    );
  }

  BaseOptions createBaseOptions() {
    final Map<String, String> baseHeaders = {
      'Accept': 'application/json',
      'content-Type': 'application/json',
    };

    BaseOptions baseOptions = BaseOptions(baseUrl: 'https://api.openweathermap.org/data/2.5/', headers: baseHeaders);
    return baseOptions;
  }

}