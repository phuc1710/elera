import 'package:injectable/injectable.dart';

import '../../core/params/update_profile_params.dart';
import '../../core/resources/data_state.dart';
import '../../core/usecases/usecases.dart';
import '../../data/models/general_response/general_response_model.dart';
import '../repositories/user_repository.dart';

@injectable
class UpdateProfileUseCase
    implements UseCase<DataState<GeneralResponseModel?>, UpdateProfileParams> {
  UpdateProfileUseCase(this._userRepository);

  final UserRepository _userRepository;

  @override
  Future<DataState<GeneralResponseModel?>> call({
    required UpdateProfileParams params,
  }) {
    return _userRepository.updateProfile(params);
  }
}
