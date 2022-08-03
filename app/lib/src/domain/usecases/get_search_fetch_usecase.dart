import 'package:injectable/injectable.dart';

import '../../core/params/search_fetch_request_params.dart';
import '../../core/resources/data_state.dart';
import '../../core/usecases/usecases.dart';
import '../../data/models/search/search_fetch_response_model.dart';
import '../repositories/search_repository.dart';

@injectable
class SearchFetchUseCase
    implements
        UseCase<DataState<SearchFetchResponseModel>, SearchFetchRequestParams> {
  SearchFetchUseCase(this._searchRepository);

  final SearchRepository _searchRepository;

  @override
  Future<DataState<SearchFetchResponseModel>> call({
    SearchFetchRequestParams? params,
  }) {
    return _searchRepository.getSearchFetchRequest(params);
  }
}
