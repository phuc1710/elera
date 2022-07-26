import 'package:injectable/injectable.dart';

import '../../core/params/recent_search_fetch_request_params.dart';
import '../../core/resources/data_state.dart';
import '../../core/usecases/usecases.dart';
import '../../data/models/search/recent_search_fetch_response_model.dart';
import '../repositories/search_repository.dart';

@injectable
class RecentSearchFetchUseCase
    implements
        UseCase<DataState<RecentSearchFetchResponseModel>,
            RecentSearchFetchRequestParams> {
  RecentSearchFetchUseCase(this._searchRepository);

  final SearchRepository _searchRepository;

  @override
  Future<DataState<RecentSearchFetchResponseModel>> call({
    RecentSearchFetchRequestParams? params,
  }) {
    return _searchRepository.getRecentSearchFetchRequest(params);
  }
}
