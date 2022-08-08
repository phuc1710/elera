import 'package:injectable/injectable.dart';

import '../../core/resources/data_state.dart';
import '../../core/usecases/usecases.dart';
import '../../data/models/api_models.dart';
import '../repositories/helper_repository.dart';

@injectable
class GetHelperCenterUseCase
    implements UseCase<DataState<HelperCenterResponseModel?>, void> {
  GetHelperCenterUseCase(this._helperRepository);

  final HelperRepository _helperRepository;

  @override
  Future<DataState<HelperCenterResponseModel?>> call({params}) {
    return _helperRepository.getHelperCenter();
  }
}
