import 'package:dio/dio.dart';

class RequestParams {
  RequestParams(
    this.endpoint, {
    this.queryParameters,
    this.headers,
    this.options,
    this.cancelToken,
    this.onReceiveProgress,
  });

  final String endpoint;
  final Map<String, dynamic>? queryParameters;
  final Map<String, dynamic>? headers;
  Options? options;
  final CancelToken? cancelToken;
  final ProgressCallback? onReceiveProgress;
  final bool isMockup = false;
}
