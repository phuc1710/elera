import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../core/params/course_fetch_request_params.dart';
import '../../../core/nd_network/network/end_points.dart';
import '../../models/course/course_fetch_response_model.dart';

part 'course_api_service.g.dart';

@RestApi(baseUrl: EndPoints.baseUrl)
abstract class CourseApiService {
  factory CourseApiService(Dio dio, {String baseUrl}) = _CourseApiService;

  @GET(EndPoints.course)
  Future<HttpResponse<CourseFetchResponseModel>> getCourseFetchRequest({
    @Header('isMockup') bool? isMockup,
    @Queries() CourseFetchRequestParams? query,
  });
}
