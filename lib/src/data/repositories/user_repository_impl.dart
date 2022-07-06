import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../core/params/create_new_pin_request_params.dart';
import '../../core/params/fill_your_profile_request_params.dart';
import '../../core/params/new_card_params.dart';
import '../../core/params/friend_invite_params.dart';
import '../../core/params/sign_in_request_params.dart';
import '../../core/params/sign_up_request_params.dart';
import '../../core/params/update_profile_params.dart';
import '../../core/resources/data_state.dart';
import '../../core/utils/extensions.dart';
import '../../domain/repositories/user_repository.dart';
import '../datasources/remote/user_api_service.dart';
import '../models/create_new_pin/create_new_pin_response_model.dart';
import '../models/fill_your_profile/fill_your_profile_response_model.dart';
import '../models/profile/profile_response_model.dart';
import '../models/payment/payment_response_model.dart';
import '../models/general_response/general_response_model.dart';
import '../models/friends/friend_response_model.dart';
import '../models/sign_in/sign_in_response_model.dart';
import '../models/sign_up/sign_up_response_model.dart';

@Injectable(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl(this._userApiService);

  final UserApiService _userApiService;

  @override
  Future<DataState<SignInResponseModel>> postSignInRequest(
    SignInRequestParams? params,
  ) async {
    try {
      final httpResponse =
          await _userApiService.postSignInRequest(isMockup: true, body: params);

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      }

      return DataFailed(httpResponse.dioError);
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<SignUpResponseModel>> postSignUpRequest(
    SignUpRequestParams? params,
  ) async {
    try {
      final httpResponse = await _userApiService.postSignUpRequest(
        isMockup: true,
        body: params,
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      }

      return DataFailed(httpResponse.dioError);
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<FillYourProfileResponseModel>> postFillYourProfileRequest(
    FillYourProfileRequestParams? params,
  ) async {
    try {
      final httpResponse = await _userApiService.postFillYourProfileRequest(
        isMockup: true,
        body: params,
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      }

      return DataFailed(httpResponse.dioError);
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<CreateNewPinResponseModel>> postCreateNewPinRequest(
    CreateNewPinRequestParams? params,
  ) async {
    try {
      final httpResponse = await _userApiService.postCreateNewPinRequest(
        isMockup: true,
        body: params,
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      }

      return DataFailed(httpResponse.dioError);
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<GeneralResponseModel?>> addNewCard(
    NewCardParams params,
  ) async {
    try {
      final httpResponse = await _userApiService.addNewCard(
        params,
        isMockup: true, // TODO(thinhhh): mockup
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

  @override
  Future<DataState<FriendResponseModel?>> getInviteFriends() async {
    try {
      final httpResponse = await _userApiService.getInviteFriends(
        isMockup: true, // TODO(thinhhh): mockup
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

  @override
  Future<DataState<PaymentResponseModel?>> getPayments() async {
    try {
      final httpResponse = await _userApiService.getPayments(
        isMockup: true, // TODO(thinhhh): mockup
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

  @override
  Future<DataState<ProfileResponseModel?>> getProfile() async {
    try {
      final httpResponse = await _userApiService.getProfile(
        isMockup: true, // TODO(thinhhh): mockup
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

  @override
  Future<DataState<FriendResponseModel?>> inviteFriend(
    FriendInviteParams params,
  ) async {
    try {
      final httpResponse = await _userApiService.inviteFriend(
        params,
        isMockup: true, // TODO(thinhhh): mockup
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

  @override
  Future<DataState<GeneralResponseModel?>> updateProfile(
    UpdateProfileParams param,
  ) async {
    try {
      final httpResponse = await _userApiService.updateProfile(
        param,
        isMockup: true, // TODO(thinhhh): mockup
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
