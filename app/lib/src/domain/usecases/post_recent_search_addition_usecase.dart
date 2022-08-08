import 'package:injectable/injectable.dart';

import '../../core/params/recent_search_addition_request_params.dart';
import '../../core/resources/data_state.dart';
import '../../core/usecases/usecases.dart';
import '../../data/models/search/recent_search_addition_response_model.dart';
import '../repositories/search_repository.dart';

@injectable
class RecentSearchAdditionUseCase
    implements
        UseCase<DataState<RecentSearchAdditionResponseModel>,
            RecentSearchAdditionRequestParams> {
  RecentSearchAdditionUseCase(this._bookmarkRepository);

  final SearchRepository _bookmarkRepository;

  @override
  Future<DataState<RecentSearchAdditionResponseModel>> call({
    RecentSearchAdditionRequestParams? params,
  }) {
    return _bookmarkRepository.postRecentSearchAdditionRequest(params);
  }
}
