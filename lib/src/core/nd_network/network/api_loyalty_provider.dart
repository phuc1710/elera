// Package imports:
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

// Project imports:
import '../interceptors/header_interceptor.dart';
import '../interceptors/mockup_interceptor.dart';
import '../mockup/mock_api.dart';
import 'end_points.dart';

class LoyaltyProvider {
  LoyaltyProvider({required this.enableLogger, required this.baseUrl}) {
    final dioOptions = BaseOptions()
      ..baseUrl = baseUrl
      ..connectTimeout = 20000
      ..receiveTimeout = 10000
      ..headers = <String, String>{
        'Content-Type': 'application/json; charset=utf-8',
      };

    loyaltyDio = Dio(dioOptions);

    //------------------HEADER---------------------------//
    loyaltyDio.interceptors.add(
      HeaderInterceptor(
        () async => <String, dynamic>{
          'x-product': LoyaltyEndPoints.product,
          'x-token': LoyaltyEndPoints.token,
        },
      ),
    );

    //----------------- LOGGING -------------------//
    if (enableLogger) {
      loyaltyDio.interceptors.add(
        PrettyDioLogger(
          requestHeader: enableLogger,
          requestBody: enableLogger,
        ),
      );
    }

    //---------------- MOCKUP -------------------//
    if (enableLogger) {
      loyaltyDio.interceptors.add(MockUpInterceptor());
    }
  }
  static const String tagDIO = 'LoyaltyProvider';

  late Dio loyaltyDio;
  bool enableLogger = false;
  String baseUrl;

  // API get:------------------------------------------------------------------
  // ignore: long-parameter-list
  Future<Map<String, dynamic>?> get(
    String uri, {
    Map<String, dynamic>? queryParameters,
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
    final response = await loyaltyDio.get<dynamic>(
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
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    bool showLoading = true,
    bool isMockupApi = false,
  }) async {
    if (isMockupApi) {
      return MockApi.post(
        uri,
        data: data,
        queryParameters: queryParameters,
      );
    }
    final response = await loyaltyDio.post<dynamic>(
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

  // API postWithSignature:---------------------------------------------------------
  // ignore: long-parameter-list
  Future<Map<String, dynamic>?> postWithSignature(
    String uri, {
    dynamic data,
    String? signature,
    Map<String, dynamic>? queryParameters,
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

    if (options != null) {
      options.headers?.addAll(<String, String?>{'x-signature': signature});
    } else {
      options = Options()
        ..headers?.addAll(<String, String?>{'x-signature': signature});
    }

    final response = await loyaltyDio.post<dynamic>(
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
