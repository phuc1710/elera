import '../../core/params/fill_your_profile_request_params.dart';
import '../../core/resources/data_state.dart';
import '../../core/usecases/usecases.dart';
import '../../data/models/fill_your_profile/fill_your_profile_response_model.dart';
import '../repositories/user_repository.dart';

class FillYourProfileUseCase
    implements
        UseCase<DataState<FillYourProfileResponseModel>,
            FillYourProfileRequestParams> {
  FillYourProfileUseCase(this._userRepository);

  final UserRepository _userRepository;

  @override
  Future<DataState<FillYourProfileResponseModel>> call({
    FillYourProfileRequestParams? params,
  }) {
    return _userRepository.postFillYourProfileRequest(params);
  }
}
