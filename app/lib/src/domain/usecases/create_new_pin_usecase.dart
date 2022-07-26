import 'package:injectable/injectable.dart';

import '../../core/params/create_new_pin_request_params.dart';
import '../../core/resources/data_state.dart';
import '../../core/usecases/usecases.dart';
import '../../data/models/create_new_pin/create_new_pin_response_model.dart';
import '../repositories/user_repository.dart';

@injectable
class CreateNewPinUseCase
    implements
        UseCase<DataState<CreateNewPinResponseModel>,
            CreateNewPinRequestParams> {
  CreateNewPinUseCase(this._userRepository);

  final UserRepository _userRepository;

  @override
  Future<DataState<CreateNewPinResponseModel>> call({
    CreateNewPinRequestParams? params,
  }) {
    return _userRepository.postCreateNewPinRequest(params);
  }
}
