import 'package:injectable/injectable.dart';

import '../../core/params/pin_sending_request_params.dart';
import '../../core/resources/data_state.dart';
import '../../core/usecases/usecases.dart';
import '../../data/models/pin_sending/pin_sending_response_model.dart';
import '../repositories/user_repository.dart';

@injectable
class PinSendingUseCase
    implements
        UseCase<DataState<PinSendingResponseModel>, PinSendingRequestParams> {
  PinSendingUseCase(this._userRepository);

  final UserRepository _userRepository;

  @override
  Future<DataState<PinSendingResponseModel>> call({
    PinSendingRequestParams? params,
  }) {
    return _userRepository.getPinSendingRequest(params);
  }
}
