// Dart imports:
import 'dart:io';

// Package imports:
import 'package:dio/dio.dart';

// Project imports:
import '../mockup/mock_api.dart';

class MockUpInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (options.method == 'GET' && options.headers['isMockUp'] == true) {
      return handler.resolve(
        await mockGetResponse(options),
      );
    }
    if (options.method == 'POST' && options.headers['isMockUp'] == true) {
      return handler.resolve(
        await mockPostResponse(options),
      );
    }

    return handler.next(options);
  }

  Future<Response<dynamic>> mockGetResponse(RequestOptions options) async {
    return Response<dynamic>(
      statusCode: HttpStatus.ok,
      requestOptions: RequestOptions(path: options.path),
      data: await MockApi.get(
        options.path,
        queryParameters: options.queryParameters,
      ),
    );
  }

  Future<Response<dynamic>> mockPostResponse(RequestOptions options) async {
    return Response<dynamic>(
      statusCode: HttpStatus.ok,
      requestOptions: RequestOptions(path: options.path),
      data: await MockApi.post(
        options.path,
        queryParameters: options.queryParameters,
      ),
    );
  }
}
