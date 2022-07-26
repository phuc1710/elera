import 'package:injectable/injectable.dart';

import '../../core/params/recent_search_removal_request_params.dart';
import '../../core/resources/data_state.dart';
import '../../core/usecases/usecases.dart';
import '../../data/models/search/recent_search_removal_response_model.dart';
import '../repositories/search_repository.dart';

@injectable
class RecentSearchRemovalUseCase
    implements
        UseCase<DataState<RecentSearchRemovalResponseModel>,
            RecentSearchRemovalRequestParams> {
  RecentSearchRemovalUseCase(this._bookmarkRepository);

  final SearchRepository _bookmarkRepository;

  @override
  Future<DataState<RecentSearchRemovalResponseModel>> call({
    RecentSearchRemovalRequestParams? params,
  }) {
    return _bookmarkRepository.postRecentSearchRemovalRequest(params);
  }
}
