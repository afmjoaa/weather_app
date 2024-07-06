import 'package:dio/dio.dart';
import 'package:weather_app/data/api_provider/base_api_provider.dart';
import 'package:weather_app/utility/utility.dart';

import '../model/error_response.dart';

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
        Utility.startLoadingAnimation();
        handler.next(options);
      },
      onResponse: (Response<dynamic> response, ResponseInterceptorHandler handler,){
        Utility.completeLoadingAnimation();
        handler.next(response);
      },
      onError:  (DioException error, ErrorInterceptorHandler handler,) {

        String errorMessage = "An error occurred";
        if (error.response != null && error.response!.data != null) {
          var errorResponse = ErrorResponse.fromJson(error.response!.data);
          errorMessage = errorResponse.message;
        }

        Utility.showLoadingFailedError(errorMessage);
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