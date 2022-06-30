// Package imports:
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

// Project imports:
import '../interceptors/header_interceptor.dart';
import '../interceptors/mockup_interceptor.dart';
import '../mockup/mock_api.dart';

class ApiProvider {
  ApiProvider({
    required this.enableLogger,
    required this.baseUrl,
    required this.getHeaders,
  }) {
    final dioOptions = BaseOptions()
      ..baseUrl = baseUrl
      ..connectTimeout = 20000
      ..receiveTimeout = 10000
      ..headers = <String, String>{
        'Content-Type': 'application/json; charset=utf-8',
      };

    apiDio = Dio(dioOptions);

    //----------------- SET HEADER ------------------//
    apiDio.interceptors.add(HeaderInterceptor(getHeaders));

    //----------------- LOGGING -------------------//
    if (enableLogger) {
      apiDio.interceptors.add(PrettyDioLogger(
        requestBody: enableLogger,
        requestHeader: enableLogger,
      ),);
    }

    //---------------- MOCKUP -------------------//
    if (enableLogger) {
      apiDio.interceptors.add(MockUpInterceptor());
    }
  }

  late Dio apiDio;
  bool enableLogger = false;
  String baseUrl;
  Future<Map<String, dynamic>> Function() getHeaders;

  // API get:------------------------------------------------------------------
  // ignore: long-parameter-list
  Future<Map<String, dynamic>?> get(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
    bool isMockupApi = false,
  }) async {
    if (isMockupApi) {
      return MockApi.get(
        uri,
        queryParameters: queryParameters,
      );
    }

    if (options != null && headers != null) {
      options.headers?.addAll(headers);
    } else {
      options = Options(headers: headers);
    }

    final response = await apiDio.get<dynamic>(
      uri,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
    );

    return response.data as Map<String, dynamic>?;
  }

  // API post:---------------------------------------------------------
  // ignore: long-parameter-list
  Future<Map<String, dynamic>?> post(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    bool isMockupApi = false,
  }) async {
    if (isMockupApi) {
      return MockApi.post(
        uri,
        data: data,
        queryParameters: queryParameters,
      );
    }

    if (options != null && headers != null) {
      options.headers?.addAll(headers);
    } else {
      options = Options(headers: headers);
    }
    final response = await apiDio.post<dynamic>(
      uri,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    return response.data as Map<String, dynamic>?;
  }
}
