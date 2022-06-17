import 'package:dio/dio.dart';

class PostParams {
  PostParams(
    this.endpoint, {
    this.body,
    this.queryParameters,
    required this.headers,
    this.options,
    this.cancelToken,
    this.onSendProgress,
    this.onReceiveProgress,
    required this.isMockup,
  });

  final String endpoint;
  final Map<String, dynamic>? body;
  final Map<String, dynamic>? queryParameters;
  final Map<String, dynamic> headers;
  Options? options;
  final CancelToken? cancelToken;
  final ProgressCallback? onSendProgress;
  final ProgressCallback? onReceiveProgress;
  final bool isMockup;
}
