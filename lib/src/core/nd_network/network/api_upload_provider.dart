// Package imports:
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

// Project imports:
import '../interceptors/mockup_interceptor.dart';
import '../mockup/mock_api.dart';
import 'end_points.dart';

class UploadProvider {
  UploadProvider({required this.enableLogger, required this.baseUrl}) {
    imageDio = Dio()
      ..options.baseUrl = baseUrl
      ..options.connectTimeout = 20000
      ..options.receiveTimeout = 10000
      ..options.queryParameters
      ..options.headers = <String, String>{
        'content-type': 'multipart/form-data',
      }
      ..options.headers = <String, String>{
        'boundary': '----WebKitFormBoundary7MA4YWxkTrZu0gW',
      };

    //----------------- LOGGING -------------------//
    if (enableLogger) {
      imageDio.interceptors.add(
        PrettyDioLogger(
          requestBody: enableLogger,
          requestHeader: enableLogger,
        ),
      );
    }

    //---------------- MOCKUP -------------------//
    if (enableLogger) {
      imageDio.interceptors.add(MockUpInterceptor());
    }
  }
  final bool enableLogger;
  final String baseUrl;
  late Dio imageDio;

  /// API upload image
  // ignore: long-parameter-list
  Future<Map<String, dynamic>?> uploadImage(
    String uri, {
    required List<String> paths,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    bool isMockupApi = false,
  }) async {
    if (isMockupApi) {
      return MockApi.post(uri);
    }
    final Response<dynamic> response = await imageDio.post<dynamic>(
      uri,
      data: await _data(paths),
      queryParameters: <String, String>{
        'product': StaticEndPoints.product,
        'token': StaticEndPoints.token,
      },
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    return response.data as Map<String, dynamic>?;
  }

  Future<FormData> _data(List<String> paths) async {
    final Map<String, MultipartFile> mapFiles = <String, MultipartFile>{};
    for (int i = 0; i < paths.length; i++) {
      // api contrains with format file1 file2
      final String fileName = 'file${i + 1}';
      mapFiles[fileName] =
          await MultipartFile.fromFile(paths[i], filename: '$fileName.jpg');
    }

    return FormData.fromMap(mapFiles);
  }
}
