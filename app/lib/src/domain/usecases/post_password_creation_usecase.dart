import 'package:injectable/injectable.dart';

import '../../core/params/password_creation_request_params.dart';
import '../../core/resources/data_state.dart';
import '../../core/usecases/usecases.dart';
import '../../data/models/password_creation/password_creation_response_model.dart';
import '../repositories/user_repository.dart';

@injectable
class PasswordCreationUseCase
    implements
        UseCase<DataState<PasswordCreationResponseModel>,
            PasswordCreationRequestParams> {
  PasswordCreationUseCase(this._userRepository);

  final UserRepository _userRepository;

  @override
  Future<DataState<PasswordCreationResponseModel>> call({
    PasswordCreationRequestParams? params,
  }) {
    return _userRepository.postPasswordCreationRequest(params);
  }
}
