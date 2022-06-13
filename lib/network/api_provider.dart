import 'package:dio/dio.dart';

import 'end_points.dart';
import 'mock_api.dart';

class ApiProvider {
  late Dio _dio;

  final int? connectTimeOut;

  final baseUrl = EndPoints.devUrl;

  ApiProvider({this.connectTimeOut = 20000}) {
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      receiveTimeout: 10000,
      connectTimeout: connectTimeOut ?? 20000,
    ));
  }

  Future<Map<String, dynamic>?> getRequest(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
    bool isMockup = false,
  }) async {
    Response response;

    if (isMockup) {
      return MockApi.get(endpoint);
    }

    if (options != null && headers != null) {
      options.headers?.addAll(headers);
    } else {
      options = Options(headers: headers);
    }

    response = await _dio.get(
      endpoint,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
    );

    return response.data as Map<String, dynamic>?;
  }

  Future<Map<String, dynamic>?> postRequest(
    String endpoint, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    bool isMockup = false,
  }) async {
    Response response;

    if (isMockup) {
      return MockApi.get(endpoint);
    }

    if (options != null && headers != null) {
      options.headers?.addAll(headers);
    } else {
      options = Options(headers: headers);
    }

    response = await _dio.post(
      endpoint,
      data: body,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    return response.data as Map<String, dynamic>?;
  }
}
