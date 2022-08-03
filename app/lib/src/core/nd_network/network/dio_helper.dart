// Package imports:
import 'package:dio/dio.dart';
import 'package:path/path.dart';

extension DioHelper on Dio {
  String getErrorMessage(DioError dioError) {
    String errorDescription = 'Có lỗi xảy ra, vui lòng thử lại sau!';
    switch (dioError.type) {
      case DioErrorType.cancel:
        errorDescription = 'Gửi yêu cầu đến máy chủ đã bị hủy';
        break;
      case DioErrorType.sendTimeout:
        errorDescription = 'Hết thời gian gửi đến máy chủ';
        break;
      case DioErrorType.receiveTimeout:
        errorDescription = 'Hết thời gian nhận dữ liệu từ máy chủ';
        break;
      case DioErrorType.connectTimeout:
        errorDescription = 'Hết thời gian kết nối với máy chủ';
        break;
      case DioErrorType.other:
        errorDescription = 'Kết nối với máy chủ không thành công';
        break;
      case DioErrorType.response:
        errorDescription =
            'Mã trạng thái máy chủ: ${dioError.response?.statusCode}';
        break;
    }

    return errorDescription;
  }
}

Future<FormData?> convertToFormData(List<String> paths) async {
  try {
    final Map<String, MultipartFile> mapFiles = <String, MultipartFile>{};
    for (int i = 0; i < paths.length; i++) {
      // api contrains with format file1 file2
      final String fileName = 'file${i + 1}';
      mapFiles[fileName] = await MultipartFile.fromFile(
        paths[i],
        filename: '$fileName${extension(paths[i])}',
      );
    }

    return FormData.fromMap(mapFiles);
  } catch (_) {
    return null;
  }
}
