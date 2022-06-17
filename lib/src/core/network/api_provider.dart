import 'package:dio/dio.dart';

import '../../domain/entities/post_params.dart';
import '../../domain/entities/request_params.dart';
import 'end_points.dart';
import 'mock_api.dart';

class ApiProvider {
  ApiProvider({this.connectTimeOut = 20000}) {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        receiveTimeout: 10000,
        connectTimeout: connectTimeOut ?? 20000,
      ),
    );
  }
  late Dio _dio;

  final int? connectTimeOut;

  final baseUrl = EndPoints.devUrl;

  Future<Map<String, dynamic>?> getRequest(
    RequestParams requestParams,
  ) async {
    Response response;

    if (requestParams.isMockup) {
      return MockApi.get(requestParams.endpoint);
    }

    if (requestParams.options != null && requestParams.headers != null) {
      requestParams.options?.headers
          ?.addAll(requestParams.headers ?? <String, dynamic>{});
    } else {
      requestParams.options = Options(headers: requestParams.headers);
    }

    response = await _dio.get<dynamic>(
      requestParams.endpoint,
      queryParameters: requestParams.queryParameters,
      options: requestParams.options,
      cancelToken: requestParams.cancelToken,
      onReceiveProgress: requestParams.onReceiveProgress,
    );

    return response.data as Map<String, dynamic>?;
  }

  Future<Map<String, dynamic>?> postRequest(
    PostParams postParams,
  ) async {
    Response response;

    if (postParams.isMockup) {
      return MockApi.get(postParams.endpoint);
    }

    if (postParams.options != null) {
      postParams.options!.headers?.addAll(postParams.headers);
    } else {
      postParams.options = Options(headers: postParams.headers);
    }

    response = await _dio.post<dynamic>(
      postParams.endpoint,
      data: postParams.body,
      queryParameters: postParams.queryParameters,
      options: postParams.options,
      cancelToken: postParams.cancelToken,
      onSendProgress: postParams.onSendProgress,
      onReceiveProgress: postParams.onReceiveProgress,
    );

    return response.data as Map<String, dynamic>?;
  }
}
