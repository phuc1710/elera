import 'dart:developer';

import '../../data/models/course/course_response_model.dart';
import '../../data/models/edit_profile/edit_profile_response_model.dart';
import '../../data/models/general_response/general_response_model.dart';
import '../../data/models/helper_center/helper_center_response_model.dart';
import '../../data/models/payment/payment_response_model.dart';
import '../../data/models/profile/profile_response_model.dart';
import '../../data/models/sign_in/sign_in_response_model.dart';
import '../params/get_params.dart';
import '../params/post_params.dart';
import '../params/update_profile_params.dart';
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
      handleExceptionCase(result.status);

      return result;
    } catch (e) {
      log(e.toString());

      return null;
    }
  }

  static Future<ProfileResponseModel?> getProfile() async {
    try {
      final canMakeRequest = await checkConnection();
      if (!canMakeRequest) {
        return ProfileResponseModel.fromJson(noConnectionRes);
      }
      final res = await http.getRequest(
        GetParams(
          EndPoints.profile,
          isMockup: true, // set false if call api,
          headers: await getHeaders(),
        ),
      );
      final result = ProfileResponseModel.fromJson(res!);
      handleExceptionCase(result.status);

      return result;
    } catch (e) {
      log(e.toString());

      return null;
    }
  }

  static Future<EditProfileResponseModel?> getCountries() async {
    try {
      final canMakeRequest = await checkConnection();
      if (!canMakeRequest) {
        return EditProfileResponseModel.fromJson(noConnectionRes);
      }
      final res = await http.getRequest(
        GetParams(
          EndPoints.countries,
          isMockup: true, // set false if call api,
          headers: await getHeaders(),
        ),
      );
      final result = EditProfileResponseModel.fromJson(res!);
      handleExceptionCase(result.status);

      return result;
    } catch (e) {
      log(e.toString());

      return null;
    }
  }

  static Future<GeneralResponseModel?> updateProfile(
    UpdateProfileParams params,
  ) async {
    try {
      final canMakeRequest = await checkConnection();
      if (!canMakeRequest) {
        return GeneralResponseModel.fromJson(noConnectionRes);
      }
      final res = await http.postRequest(
        PostParams(
          EndPoints.profile,
          queryParameters: params.toJson(),
          isMockup: true, // set false if call api,
          headers: await getHeaders(),
        ),
      );
      final result = GeneralResponseModel.fromJson(res!);
      handleExceptionCase(result.status);

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
      handleExceptionCase(result.status);

      return result;
    } catch (e) {
      log(e.toString());

      return null;
    }
  }
}
