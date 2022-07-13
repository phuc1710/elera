import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../core/nd_network/network/end_points.dart';
import '../../../core/params/home_fetch_request_params.dart';
import '../../models/home/home_fetch_response_model.dart';

part 'home_api_service.g.dart';

@RestApi(baseUrl: EndPoints.baseUrl)
abstract class HomeApiService {
  factory HomeApiService(Dio dio, {String baseUrl}) = _HomeApiService;

  @GET(EndPoints.home)
  Future<HttpResponse<HomeFetchResponseModel>> getHomeFetchRequest({
    @Header('isMockup') bool? isMockup,
    @Queries() HomeFetchRequestParams? query,
  });
}
