import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../core/nd_network/network/end_points.dart';
import '../../../core/params/inbox_fetch_request_params.dart';
import '../../models/inbox/inbox_fetch_response_model.dart';

part 'inbox_api_service.g.dart';

@RestApi(baseUrl: EndPoints.baseUrl)
abstract class InboxApiService {
  factory InboxApiService(Dio dio, {String baseUrl}) = _InboxApiService;

  @GET(EndPoints.inbox)
  Future<HttpResponse<InboxFetchResponseModel>> getInboxFetchRequest({
    @Header('isMockup') bool? isMockup,
    @Queries() InboxFetchRequestParams? query,
  });
}
