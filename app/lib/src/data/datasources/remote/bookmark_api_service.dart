import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../core/nd_network/network/end_points.dart';
import '../../../core/params/bookmark_addition_request_params.dart';
import '../../../core/params/bookmark_fetch_request_params.dart';
import '../../../core/params/bookmark_removal_request_params.dart';
import '../../models/bookmark/bookmark_addition_response_model.dart';
import '../../models/bookmark/bookmark_fetch_response_model.dart';
import '../../models/bookmark/bookmark_removal_response_model.dart';

part 'bookmark_api_service.g.dart';

@RestApi(baseUrl: EndPoints.baseUrl)
abstract class BookmarkApiService {
  factory BookmarkApiService(Dio dio, {String baseUrl}) = _BookmarkApiService;

  @GET(EndPoints.bookmark)
  Future<HttpResponse<BookmarkFetchResponseModel>> getBookmarkFetchRequest({
    @Header('isMockup') bool? isMockup,
    @Queries() BookmarkFetchRequestParams? query,
  });

  @POST(EndPoints.addBookmark)
  Future<HttpResponse<BookmarkAdditionResponseModel>>
      postBookmarkAdditionRequest({
    @Header('isMockup') bool? isMockup,
    @Queries() BookmarkAdditionRequestParams? query,
  });

  @POST(EndPoints.removeBookmark)
  Future<HttpResponse<BookmarkRemovalResponseModel>>
      postBookmarkRemovalRequest({
    @Header('isMockup') bool? isMockup,
    @Queries() BookmarkRemovalRequestParams? query,
  });
}
