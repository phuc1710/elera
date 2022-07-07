import 'package:injectable/injectable.dart';

import '../../core/resources/data_state.dart';
import '../../core/usecases/usecases.dart';
import '../../data/models/profile/profile_response_model.dart';
import '../repositories/user_repository.dart';

@injectable
class GetProfileUseCase
    implements UseCase<DataState<ProfileResponseModel?>, void> {
  GetProfileUseCase(this._userRepository);

  final UserRepository _userRepository;

  @override
  Future<DataState<ProfileResponseModel?>> call({params}) {
    return _userRepository.getProfile();
  }
}
