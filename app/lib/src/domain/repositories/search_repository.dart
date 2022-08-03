import '../../core/params/recent_search_addition_request_params.dart';
import '../../core/params/recent_search_fetch_request_params.dart';
import '../../core/params/recent_search_removal_request_params.dart';
import '../../core/params/search_fetch_request_params.dart';
import '../../core/resources/data_state.dart';
import '../../data/models/search/recent_search_addition_response_model.dart';
import '../../data/models/search/recent_search_fetch_response_model.dart';
import '../../data/models/search/recent_search_removal_response_model.dart';
import '../../data/models/search/search_fetch_response_model.dart';

abstract class SearchRepository {
  Future<DataState<RecentSearchFetchResponseModel>> getRecentSearchFetchRequest(
    RecentSearchFetchRequestParams? params,
  );

  Future<DataState<RecentSearchAdditionResponseModel>>
      postRecentSearchAdditionRequest(
    RecentSearchAdditionRequestParams? params,
  );

  Future<DataState<RecentSearchRemovalResponseModel>>
      postRecentSearchRemovalRequest(
    RecentSearchRemovalRequestParams? params,
  );

  Future<DataState<SearchFetchResponseModel>> getSearchFetchRequest(
    SearchFetchRequestParams? params,
  );
}
