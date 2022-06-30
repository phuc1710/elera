import 'dart:io';

import 'package:dio/dio.dart';

import '../../core/params/sign_in_request_params.dart';
import '../../core/resources/data_state.dart';
import '../../domain/repositories/sign_in_repositories.dart';
import '../datasources/remote/user_api_service.dart';
import '../models/sign_in/sign_in_response_model.dart';

class SignInRepositoryImpl implements SignInRepository {
  SignInRepositoryImpl(this._signInApiService);

  final UserApiService _signInApiService;

  @override
  Future<DataState<SignInResponseModel>> postSignInRequest(
    SignInRequestParams? params,
  ) async {
    try {
      final httpResponse = await _signInApiService.postSignInRequest(
        isMockup: true,
        body: params,
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      }

      return DataFailed(
        DioError(
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
          requestOptions: httpResponse.response.requestOptions,
          type: DioErrorType.response,
        ),
      );
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }
}
