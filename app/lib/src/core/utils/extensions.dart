import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart';

extension HttpResponseHelper on HttpResponse {
  DioError get dioError => DioError(
        error: response.statusMessage,
        response: response,
        requestOptions: response.requestOptions,
        type: DioErrorType.response,
      );
}
