
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app/data/model/base_model.dart';

part 'error_response.freezed.dart';
part 'error_response.g.dart';


@Freezed(
  copyWith: false,
  equal: false,
  toStringOverride: false,
)
class ErrorResponse extends
     BaseModel<ErrorResponse> with _$ErrorResponse {
  const factory ErrorResponse(
      int code,
      String message,
      ) = _ErrorResponse;

  factory ErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$ErrorResponseFromJson(json);
}