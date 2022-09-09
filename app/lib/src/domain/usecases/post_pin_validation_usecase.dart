import 'package:injectable/injectable.dart';

import '../../core/params/pin_validation_request_params.dart';
import '../../core/resources/data_state.dart';
import '../../core/usecases/usecases.dart';
import '../../data/models/pin_validation/pin_validation_response_model.dart';
import '../repositories/user_repository.dart';

@injectable
class PinValidationUseCase
    implements
        UseCase<DataState<PinValidationResponseModel>,
            PinValidationRequestParams> {
  PinValidationUseCase(this._userRepository);

  final UserRepository _userRepository;

  @override
  Future<DataState<PinValidationResponseModel>> call({
    PinValidationRequestParams? params,
  }) {
    return _userRepository.postPinEntryRequest(params);
  }
}
