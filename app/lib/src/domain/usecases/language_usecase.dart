// Package imports:
import 'package:injectable/injectable.dart';

// Project imports:
import '../../core/usecases/usecases.dart';
import '../../data/models/language/language_response_model.dart';
import '../repositories/helper_repository.dart';

@lazySingleton
class LanguageUseCase implements UseCase<LanguageModel?, void> {
  const LanguageUseCase(this._helperRepository);

  final HelperRepository _helperRepository;

  @override
  Future<LanguageModel?> call({final void params}) {
    return _helperRepository.cacheLanguage;
  }
}
