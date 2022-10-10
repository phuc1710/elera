import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../core/nd_network/network/end_points.dart';
import '../../../core/params/course_details_fetch_request_params.dart';
import '../../../core/params/course_fetch_request_params.dart';
import '../../../core/params/course_lessons_fetch_request_params.dart';
import '../../../core/params/course_reviews_fetch_request_params.dart';
import '../../../core/params/enroll_course_request_params.dart';
import '../../../core/params/update_lesson_time_request_params.dart';
import '../../models/course/course_fetch_response_model.dart';
import '../../models/course_details/course_details_fetch_response_model.dart';
import '../../models/course_lessons/course_lessons_fetch_response_model.dart';
import '../../models/course_reviews/course_reviews_fetch_response_model.dart';
import '../../models/enroll_course/enroll_course_response_model.dart';
import '../../models/update_lesson_time/update_lesson_time_respose_model.dart';

part 'course_api_service.g.dart';

@RestApi(baseUrl: EndPoints.baseUrl)
abstract class CourseApiService {
  factory CourseApiService(Dio dio, {String baseUrl}) = _CourseApiService;

  @GET(EndPoints.course)
  Future<HttpResponse<CourseFetchResponseModel>> getCourseFetchRequest({
    @Header('isMockup') bool? isMockup,
    @Queries() CourseFetchRequestParams? query,
  });

  @GET(EndPoints.courseDetails)
  Future<HttpResponse<CourseDetailsFetchResponseModel>>
      getCourseDetailsFetchRequest({
    @Header('isMockup') bool? isMockup,
    @Queries() CourseDetailsFetchRequestParams? query,
  });

  @GET(EndPoints.courseLessons)
  Future<HttpResponse<CourseLessonsFetchResponseModel>>
      getCourseLessonsFetchRequest({
    @Header('isMockup') bool? isMockup,
    @Queries() CourseLessonsFetchRequestParams? query,
  });

  @GET(EndPoints.courseReviews)
  Future<HttpResponse<CourseReviewsFetchResponseModel>>
      getCourseReviewsFetchRequest({
    @Header('isMockup') bool? isMockup,
    @Queries() CourseReviewsFetchRequestParams? query,
  });

  @POST(EndPoints.enrollCourse)
  Future<HttpResponse<EnrollCourseResponseModel>> postEnrollCourseRequest({
    @Header('isMockup') bool? isMockup,
    @Queries() EnrollCourseRequestParams? query,
  });

  @POST(EndPoints.updateLessonTime)
  Future<HttpResponse<UpdateLessonTimeResponseModel>> postUpdateLessonTimeRequest({
    @Header('isMockup') bool? isMockup,
    @Body() UpdateLessonTimeRequestParams? body,
  });
}
