import 'package:injectable/injectable.dart';

import '../../core/params/home_fetch_request_params.dart';
import '../../core/resources/data_state.dart';
import '../../core/usecases/usecases.dart';
import '../../data/models/home/home_fetch_response_model.dart';
import '../repositories/home_repository.dart';

@injectable
class HomeFetchUseCase
    implements
        UseCase<DataState<HomeFetchResponseModel>, HomeFetchRequestParams> {
  HomeFetchUseCase(this._homeRepository);

  final HomeRepository _homeRepository;

  @override
  Future<DataState<HomeFetchResponseModel>> call({
    HomeFetchRequestParams? params,
  }) {
    return _homeRepository.getHomeFetchRequest(params);
  }
}
