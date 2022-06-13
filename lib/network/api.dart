import 'dart:developer';
import '../models/login/login_response_model.dart';
import 'end_points.dart';
import 'api_provider.dart';
import 'network_helper.dart';

class Api {
  static final ApiProvider http = ApiProvider();

  static Future<Map<String, dynamic>> getHeaders() async {
    return {
      'version': 'version app',
      'token': 'token',
    };
  }

  static Future<LoginResponseModel?> login({
    required String email,
    required String password,
  }) async {
    try {
      final canMakeRequest = await checkConnection();
      if (!canMakeRequest) {
        return LoginResponseModel.fromJson(noConnectionRes);
      }
      final res = await http.postRequest(
        EndPoints.login,
        isMockup: true, // set false if call api
        headers: await getHeaders(),
        body: {
          'email': email,
          'pass': password,
        },
      );
      final result = LoginResponseModel.fromJson(res!);
      handleExceptionCase(result.status);
      return result;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}
