import 'package:injectable/injectable.dart';

import '../../core/resources/data_state.dart';
import '../../core/usecases/usecases.dart';
import '../../data/models/language/language_response_model.dart';
import '../repositories/helper_repository.dart';

@injectable
class GetLanguagesUseCase
    implements UseCase<DataState<LanguageResponseModel?>, void> {
  GetLanguagesUseCase(this._helperRepository);

  final HelperRepository _helperRepository;

  @override
  Future<DataState<LanguageResponseModel?>> call({params}) {
    return _helperRepository.getLanguages();
  }
}
