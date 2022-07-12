import 'package:injectable/injectable.dart';

import '../../core/params/deal_fetch_request_params.dart';
import '../../core/resources/data_state.dart';
import '../../core/usecases/usecases.dart';
import '../../data/models/deal/deal_fetch_response_model.dart';
import '../repositories/home_repository.dart';

@injectable
class DealFetchUseCase
    implements
        UseCase<DataState<DealFetchResponseModel>, DealFetchRequestParams> {
  DealFetchUseCase(this._homeRepository);

  final HomeRepository _homeRepository;

  @override
  Future<DataState<DealFetchResponseModel>> call({
    DealFetchRequestParams? params,
  }) {
    return _homeRepository.getDealFetchRequest(params);
  }
}
