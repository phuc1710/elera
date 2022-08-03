import 'package:injectable/injectable.dart';

import '../../core/params/pin_entry_request_params.dart';
import '../../core/resources/data_state.dart';
import '../../core/usecases/usecases.dart';
import '../../data/models/pin_entry/pin_entry_response_model.dart';
import '../repositories/user_repository.dart';

@injectable
class PinEntryUseCase
    implements
        UseCase<DataState<PinEntryResponseModel>, PinEntryRequestParams> {
  PinEntryUseCase(this._userRepository);

  final UserRepository _userRepository;

  @override
  Future<DataState<PinEntryResponseModel>> call({
    PinEntryRequestParams? params,
  }) {
    return _userRepository.postPinEntryRequest(params);
  }
}
