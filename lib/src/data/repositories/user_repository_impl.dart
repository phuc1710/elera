import 'dart:io';

import 'package:dio/dio.dart';

import '../../core/params/sign_in_request_params.dart';
import '../../core/params/sign_up_request_params.dart';
import '../../core/resources/data_state.dart';
import '../../domain/repositories/user_repository.dart';
import '../datasources/remote/user_api_service.dart';
import '../models/sign_in/sign_in_response_model.dart';
import '../models/sign_up/sign_up_response_model.dart';

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl(this._userApiService);

  final UserApiService _userApiService;

  @override
  Future<DataState<SignInResponseModel>> postSignInRequest(
    SignInRequestParams? params,
  ) async {
    final httpResponse = await _userApiService.postSignInRequest(
      isMockup: true,
      body: params,
    );

    if (httpResponse.response.statusCode == HttpStatus.ok) {
      return DataSuccess(httpResponse.data);
    }

    return DataFailed(httpResponse.data);
  }

  @override
  Future<DataState<SignUpResponseModel>> postSignUpRequest(
    SignUpRequestParams? params,
  ) async {
    final httpResponse = await _userApiService.postSignUpRequest(
      isMockup: true,
      body: params,
    );

    if (httpResponse.response.statusCode == HttpStatus.ok) {
      return DataSuccess(httpResponse.data);
    }

    return DataFailed(httpResponse.data);
  }
}
