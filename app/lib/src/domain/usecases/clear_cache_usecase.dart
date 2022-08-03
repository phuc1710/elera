import 'package:injectable/injectable.dart';

import '../../core/usecases/usecases.dart';
import '../repositories/helper_repository.dart';

@injectable
class ClearCacheUseCase implements UseCase<void, void> {
  ClearCacheUseCase(this._helperRepository);

  final HelperRepository _helperRepository;

  @override
  Future<void> call({params}) {
    return _helperRepository.clearCache();
  }
}
