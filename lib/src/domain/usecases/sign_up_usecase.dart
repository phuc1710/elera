import '../../core/params/sign_up_request_params.dart';
import '../../core/resources/data_state.dart';
import '../../core/usecases/usecases.dart';
import '../../data/models/sign_up/sign_up_response_model.dart';
import '../repositories/user_repository.dart';

class SignUpUseCase
    implements UseCase<DataState<SignUpResponseModel>, SignUpRequestParams> {
  SignUpUseCase(this._userRepository);

  final UserRepository _userRepository;

  @override
  Future<DataState<SignUpResponseModel>> call({SignUpRequestParams? params}) {
    return _userRepository.postSignUpRequest(params);
  }
}
