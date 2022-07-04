import '../../core/params/sign_in_request_params.dart';
import '../../core/resources/data_state.dart';
import '../../core/usecases/usecases.dart';
import '../../data/models/sign_in/sign_in_response_model.dart';
import '../repositories/user_repository.dart';

class SignInUseCase
    implements UseCase<DataState<SignInResponseModel>, SignInRequestParams> {
  SignInUseCase(this._userRepository);

  final UserRepository _userRepository;

  @override
  Future<DataState<SignInResponseModel>> call({SignInRequestParams? params}) {
    return _userRepository.postSignInRequest(params);
  }
}
