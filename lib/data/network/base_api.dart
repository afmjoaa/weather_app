import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:weather_app/data/api_provider/base_api_provider.dart';
import 'package:weather_app/data/model/base_model.dart';

abstract class BaseApi<TQuery extends BaseModel, TRes extends BaseModel,
    TErr extends BaseModel> {
  String url;
  BaseApiProvider apiProvider;

  BaseApi(this.url, this.apiProvider);

  Future<Response<Map<String, dynamic>>> getRaw({
    Map<String, String>? headers,
    Map<String, dynamic>? queryParams,
  }) async {
    Response<Map<String, dynamic>> response = await apiProvider.dio.get(
      url,
      options: Options(
        headers: headers,
        sendTimeout: BaseApiProvider.connectTimeOut,
        receiveTimeout: BaseApiProvider.receiveTimeOut,
      ),
      queryParameters: queryParams
    );
    return response;
  }

  Future<Either<TRes, TErr>> get({
    Map<String, String>? headers,
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      Response<Map<String, dynamic>> response = await getRaw(headers: headers, queryParams: queryParams);
      return Left(mapSuccessResponse(response.data) as TRes);
    } on DioException catch (err) {
      if(err.response != null && err.response!.data != null) {
        return Right(mapErrorResponse(err.response!.data) as TErr);
      }
      return Right(mapErrorResponse({"code": 9999, "message": "Unknown error"}) as TErr);
    }
  }

  BaseModel mapSuccessResponse(Map<String, dynamic>? responseJson);
  BaseModel mapErrorResponse(Map<String, dynamic>? errorJson);
}
