import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../core/nd_network/network/end_points.dart';
import '../../../core/params/deal_fetch_request_params.dart';
import '../../models/deal/deal_fetch_response_model.dart';

part 'home_api_service.g.dart';

@RestApi(baseUrl: EndPoints.baseUrl)
abstract class HomeApiService {
  factory HomeApiService(Dio dio, {String baseUrl}) = _HomeApiService;

  @GET(EndPoints.deal)
  Future<HttpResponse<DealFetchResponseModel>> getDealFetchRequest({
    @Header('isMockup') bool? isMockup,
    @Queries() DealFetchRequestParams? query,
  });
}
