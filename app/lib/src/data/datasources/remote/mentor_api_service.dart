import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../core/nd_network/network/end_points.dart';
import '../../../core/params/mentor_courses_fetch_request_params.dart';
import '../../../core/params/mentor_fetch_request_params.dart';
import '../../../core/params/mentor_reviews_fetch_request_params.dart';
import '../../../core/params/mentor_students_fetch_request_params.dart';
import '../../models/mentor/mentor_fetch_response_model.dart';
import '../../models/mentor_courses/mentor_courses_fetch_response_model.dart';
import '../../models/mentor_reviews/mentor_reviews_fetch_response_model.dart';
import '../../models/mentor_students/mentor_students_fetch_response_model.dart';

part 'mentor_api_service.g.dart';

@RestApi(baseUrl: EndPoints.baseUrl)
abstract class MentorApiService {
  factory MentorApiService(Dio dio, {String baseUrl}) = _MentorApiService;

  @GET(EndPoints.mentor)
  Future<HttpResponse<MentorFetchResponseModel>> getMentorFetchRequest({
    @Header('isMockup') bool? isMockup,
    @Queries() MentorFetchRequestParams? query,
  });

  @GET(EndPoints.mentorCourses)
  Future<HttpResponse<MentorCoursesFetchResponseModel>>
      getMentorCoursesFetchRequest({
    @Header('isMockup') bool? isMockup,
    @Queries() MentorCoursesFetchRequestParams? query,
  });

  @GET(EndPoints.mentorStudents)
  Future<HttpResponse<MentorStudentsFetchResponseModel>>
      getMentorStudentsFetchRequest({
    @Header('isMockup') bool? isMockup,
    @Queries() MentorStudentsFetchRequestParams? query,
  });

  @GET(EndPoints.mentorReviews)
  Future<HttpResponse<MentorReviewsFetchResponseModel>>
      getMentorReviewsFetchRequest({
    @Header('isMockup') bool? isMockup,
    @Queries() MentorReviewsFetchRequestParams? query,
  });
}
