import 'dart:developer';

import '../../data/models/course/course_response_model.dart';
import '../../data/models/helper_center/helper_center_response_model.dart';
import '../../data/models/payment/payment_response_model.dart';
import '../nd_network/network/end_points.dart';
import '../params/get_params.dart';
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

  static Future<CourseFetchResponseModel?> getCourses() async {
    try {
      final canMakeRequest = await checkConnection();
      if (!canMakeRequest) {
        return CourseFetchResponseModel.fromJson(noConnectionRes);
      }
      final res = await http.getRequest(
        GetParams(
          EndPoints.course,
          isMockup: true, // set false if call api,
          headers: await getHeaders(),
        ),
      );
      final result = CourseFetchResponseModel.fromJson(res!);
      handleExceptionCase(result.errorCode);

      return result;
    } catch (e) {
      log(e.toString());

      return null;
    }
  }

  static Future<HelperCenterResponseModel?> getHelperCenter() async {
    try {
      final canMakeRequest = await checkConnection();
      if (!canMakeRequest) {
        return HelperCenterResponseModel.fromJson(noConnectionRes);
      }
      final res = await http.getRequest(
        GetParams(
          EndPoints.helperCenter,
          isMockup: true, // set false if call api,
          headers: await getHeaders(),
        ),
      );
      final result = HelperCenterResponseModel.fromJson(res!);
      handleExceptionCase(result.errorCode);

      return result;
    } catch (e) {
      log(e.toString());

      return null;
    }
  }

  static Future<PaymentResponseModel?> getPayments() async {
    try {
      final canMakeRequest = await checkConnection();
      if (!canMakeRequest) {
        return PaymentResponseModel.fromJson(noConnectionRes);
      }
      final res = await http.getRequest(
        GetParams(
          EndPoints.payments,
          isMockup: true, // set false if call api,
          headers: await getHeaders(),
        ),
      );
      final result = PaymentResponseModel.fromJson(res!);
      handleExceptionCase(result.errorCode);

      return result;
    } catch (e) {
      log(e.toString());

      return null;
    }
  }
}
