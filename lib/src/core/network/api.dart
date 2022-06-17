import 'dart:developer';
import '../../domain/entities/post_params.dart';
import '../../models/login/login_response_model.dart';
import 'end_points.dart';
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
      final result = LoginResponseModel.fromJson(res!);
      handleExceptionCase(result.status);

      return result;
    } catch (e) {
      log(e.toString());

      return null;
    }
  }
}
