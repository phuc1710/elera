import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../core/nd_network/network/end_points.dart';
import '../../../core/params/mentor_fetch_request_params.dart';
import '../../models/mentor/mentor_fetch_response_model.dart';

part 'mentor_api_service.g.dart';

@RestApi(baseUrl: EndPoints.baseUrl)
abstract class MentorApiService {
  factory MentorApiService(Dio dio, {String baseUrl}) = _MentorApiService;

  @GET(EndPoints.mentor)
  Future<HttpResponse<MentorFetchResponseModel>> getMentorFetchRequest({
    @Header('isMockup') bool? isMockup,
    @Queries() MentorFetchRequestParams? query,
  });
}
