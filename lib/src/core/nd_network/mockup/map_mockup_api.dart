// Project imports:
import '../network/end_points.dart';

final Map<String, String> mapMockApiForGetRequest = {};

final Map<String, String> mapMockApiForPostRequest = {
  EndPoints.signIn: 'sign_in',
  EndPoints.signUp: 'sign_up',
};

String? getJsonNameForGetRequest(
  String endpoint, {
  Map<String, dynamic>? queryParameters,
}) {
  return mapMockApiForGetRequest[endpoint];
}

String? getJsonNameForPostRequest(
  String endpoint, {
  dynamic data,
  Map<String, dynamic>? queryParameters,
}) {
  return mapMockApiForPostRequest[endpoint];
}
