// Package imports:
import 'package:injectable/injectable.dart';

// Project imports:
import '../../core/usecases/usecases.dart';
import '../repositories/user_repository.dart';

@lazySingleton
class AccessTokenUseCase implements UseCase<String, void> {
  const AccessTokenUseCase(this._userRepository);

  final UserRepository _userRepository;

  @override
  Future<String> call({final void params}) {
    return _userRepository.accessToken;
  }
}
