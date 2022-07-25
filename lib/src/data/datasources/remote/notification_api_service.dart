import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../core/nd_network/network/end_points.dart';
import '../../../core/params/notification_fetch_request_params.dart';
import '../../models/notification/notification_fetch_response_model.dart';

part 'notification_api_service.g.dart';

@RestApi(baseUrl: EndPoints.baseUrl)
abstract class NotificationApiService {
  factory NotificationApiService(Dio dio, {String baseUrl}) = _NotificationApiService;

  @GET(EndPoints.notification)
  Future<HttpResponse<NotificationFetchResponseModel>>
      getNotificationFetchRequest({
    @Header('isMockup') bool? isMockup,
    @Queries() NotificationFetchRequestParams? query,
  });
}
