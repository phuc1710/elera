import 'dart:developer';

import '../../data/models/course/course_response_model.dart';
import '../../data/models/sign_in/sign_in_response_model.dart';
import '../params/get_params.dart';
import '../params/post_params.dart';
import '../utils/constants.dart';
import 'api_provider.dart';
import 'network_helper.dart';

class Api {
  static final ApiProvider http = ApiProvider();

  static Future<Map<String, dynamic>> getHeaders() async {
    return <String, dynamic>{
      'version': 'version app',
      'token': 'token',
    };
  }

  static Future<SignInResponseModel?> login({
    required String email,
    required String password,
  }) async {
    try {
      final canMakeRequest = await checkConnection();
      if (!canMakeRequest) {
        return SignInResponseModel.fromJson(noConnectionRes);
      }
      final res = await http.postRequest(
        PostParams(
          EndPoints.login,
          isMockup: true, // set false if call api,
          headers: await getHeaders(),
          body: <String, dynamic>{
            'email': email,
            'pass': password,
          },
        ),
      );
      final result = SignInResponseModel.fromJson(res!);
      handleExceptionCase(result.status);

      return result;
    } catch (e) {
      log(e.toString());

      return null;
    }
  }

  static Future<CourseResponseModel?> getCourses() async {
    try {
      final canMakeRequest = await checkConnection();
      if (!canMakeRequest) {
        return CourseResponseModel.fromJson(noConnectionRes);
      }
      final res = await http.getRequest(
        GetParams(
          EndPoints.course,
          isMockup: true, // set false if call api,
          headers: await getHeaders(),
        ),
      );
      final result = CourseResponseModel.fromJson(res!);
      handleExceptionCase(result.status);

      return result;
    } catch (e) {
      log(e.toString());

      return null;
    }
  }
}
