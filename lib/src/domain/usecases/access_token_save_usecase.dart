// Package imports:
import 'package:injectable/injectable.dart';

import '../../core/usecases/usecases.dart';
import '../repositories/user_repository.dart';

// Project imports:

@injectable
class AccessTokenSaveUseCase implements UseCase<bool, String?> {
  const AccessTokenSaveUseCase(this._userRepository);

  final UserRepository _userRepository;

  @override
  Future<bool> call({required final String? params}) {
    return _userRepository.saveAccessToken(params);
  }
}
