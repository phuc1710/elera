// Package imports:
import 'package:injectable/injectable.dart';

// Project imports:
import '../../core/usecases/usecases.dart';
import '../../data/models/language/language_response_model.dart';
import '../repositories/helper_repository.dart';

@lazySingleton
class LanguageSaveUseCase implements UseCase<bool, LanguageModel?> {
  const LanguageSaveUseCase(this._helperRepository);

  final HelperRepository _helperRepository;

  @override
  Future<bool> call({final LanguageModel? params}) {
    return _helperRepository.saveLanguage(params);
  }
}
