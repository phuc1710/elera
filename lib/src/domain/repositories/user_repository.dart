import '../../core/params/create_new_pin_request_params.dart';
import '../../core/params/fill_your_profile_request_params.dart';
import '../../core/params/sign_in_request_params.dart';
import '../../core/params/sign_up_request_params.dart';
import '../../core/resources/data_state.dart';
import '../../data/models/create_new_pin/create_new_pin_response_model.dart';
import '../../data/models/fill_your_profile/fill_your_profile_response_model.dart';
import '../../data/models/sign_in/sign_in_response_model.dart';
import '../../data/models/sign_up/sign_up_response_model.dart';

abstract class UserRepository {
  Future<DataState<SignInResponseModel>> postSignInRequest(
    SignInRequestParams? params,
  );

  Future<DataState<SignUpResponseModel>> postSignUpRequest(
    SignUpRequestParams? params,
  );

  Future<DataState<FillYourProfileResponseModel>> postFillYourProfileRequest(
    FillYourProfileRequestParams? params,
  );

  Future<DataState<CreateNewPinResponseModel>> postCreateNewPinRequest(
    CreateNewPinRequestParams? params,
  );
}
