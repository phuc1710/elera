import '../../core/params/sign_in_request_params.dart';
import '../../core/resources/data_state.dart';
import '../../data/models/sign_in/sign_in_response_model.dart';

abstract class SignInRepository {
  Future<DataState<SignInResponseModel>> postSignInRequest(
    SignInRequestParams? params,
  );
}
