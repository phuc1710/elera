import '../../core/params/sign_in_request_params.dart';
import '../../core/params/sign_up_request_params.dart';
import '../../core/resources/data_state.dart';
import '../../data/models/sign_in/sign_in_response_model.dart';
import '../../data/models/sign_up/sign_up_response_model.dart';

abstract class UserRepository {
  Future<DataState<SignInResponseModel>> postSignInRequest(
    SignInRequestParams? params,
  );

  Future<DataState<SignUpResponseModel>> postSignUpRequest(
    SignUpRequestParams? params,
  );
}
