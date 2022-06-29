import 'package:dio/dio.dart';

class GetParams {
  GetParams(
    this.endpoint, {
    this.queryParameters,
    this.headers,
    this.options,
    this.cancelToken,
    this.onReceiveProgress,
    required this.isMockup,
  });

  final String endpoint;
  final Map<String, dynamic>? queryParameters;
  final Map<String, dynamic>? headers;
  Options? options;
  final CancelToken? cancelToken;
  final ProgressCallback? onReceiveProgress;
  bool isMockup = false;
}
