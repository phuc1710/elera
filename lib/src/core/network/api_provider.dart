import 'package:dio/dio.dart';

import '../params/get_params.dart';
import '../params/post_params.dart';
import '../utils/constants.dart';
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
    GetParams getParams,
  ) async {
    Response response;

    if (getParams.isMockup) {
      return MockApi.get(getParams.endpoint);
    }

    if (getParams.options != null && getParams.headers != null) {
      getParams.options?.headers
          ?.addAll(getParams.headers ?? <String, dynamic>{});
    } else {
      getParams.options = Options(headers: getParams.headers);
    }

    response = await _dio.get<dynamic>(
      getParams.endpoint,
      queryParameters: getParams.queryParameters,
      options: getParams.options,
      cancelToken: getParams.cancelToken,
      onReceiveProgress: getParams.onReceiveProgress,
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

    if (postParams.options != null && postParams.headers != null) {
      postParams.options?.headers
          ?.addAll(postParams.headers ?? <String, dynamic>{});
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
