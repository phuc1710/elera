import 'package:injectable/injectable.dart';

import '../../core/resources/data_state.dart';
import '../../core/usecases/usecases.dart';
import '../../data/models/edit_profile/edit_profile_response_model.dart';
import '../repositories/helper_repository.dart';

@injectable
class GetCountriesUseCase
    implements UseCase<DataState<EditProfileResponseModel?>, void> {
  GetCountriesUseCase(this._helperRepository);

  final HelperRepository _helperRepository;

  @override
  Future<DataState<EditProfileResponseModel?>> call({params}) {
    return _helperRepository.getCountries();
  }
}
