import '../../core/params/sign_in_request_params.dart';
import '../../core/resources/data_state.dart';
import '../../core/usecases/usecases.dart';
import '../../data/models/sign_in/sign_in_response_model.dart';
import '../repositories/sign_in_repositories.dart';

class SignInUseCase
    implements UseCase<DataState<SignInResponseModel>, SignInRequestParams> {
  SignInUseCase(this._signInRepository);

  final SignInRepository _signInRepository;

  @override
  Future<DataState<SignInResponseModel>> call({SignInRequestParams? params}) {
    return _signInRepository.postSignInRequest(params);
  }
}
