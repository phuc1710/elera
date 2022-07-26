import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../core/nd_network/network/end_points.dart';
import '../../../core/params/recent_search_addition_request_params.dart';
import '../../../core/params/recent_search_fetch_request_params.dart';
import '../../../core/params/recent_search_removal_request_params.dart';
import '../../../core/params/search_fetch_request_params.dart';
import '../../models/search/recent_search_addition_response_model.dart';
import '../../models/search/recent_search_fetch_response_model.dart';
import '../../models/search/recent_search_removal_response_model.dart';
import '../../models/search/search_fetch_response_model.dart';

part 'search_api_service.g.dart';

@RestApi(baseUrl: EndPoints.baseUrl)
abstract class SearchApiService {
  factory SearchApiService(Dio dio, {String baseUrl}) = _SearchApiService;
  @GET(EndPoints.recentSearch)
  Future<HttpResponse<RecentSearchFetchResponseModel>>
      getRecentSearchFetchRequest({
    @Header('isMockup') bool? isMockup,
    @Queries() RecentSearchFetchRequestParams? query,
  });

  @POST(EndPoints.addRecentSearch)
  Future<HttpResponse<RecentSearchAdditionResponseModel>>
      postRecentSearchAdditionRequest({
    @Header('isMockup') bool? isMockup,
    @Body() RecentSearchAdditionRequestParams? body,
  });

  @POST(EndPoints.removeRecentSearch)
  Future<HttpResponse<RecentSearchRemovalResponseModel>>
      postRecentSearchRemovalRequest({
    @Header('isMockup') bool? isMockup,
    @Body() RecentSearchRemovalRequestParams? body,
  });

  @GET(EndPoints.search)
  Future<HttpResponse<SearchFetchResponseModel>> getSearchFetchRequest({
    @Header('isMockup') bool? isMockup,
    @Queries() SearchFetchRequestParams? query,
  });
}
