import '../../core/params/course_details_fetch_request_params.dart';
import '../../core/params/course_fetch_request_params.dart';
import '../../core/params/course_lessons_fetch_request_params.dart';
import '../../core/params/course_reviews_fetch_request_params.dart';
import '../../core/params/enroll_course_request_params.dart';
import '../../core/params/update_lesson_time_request_params.dart';
import '../../core/resources/data_state.dart';
import '../../data/models/course/course_fetch_response_model.dart';
import '../../data/models/course_details/course_details_fetch_response_model.dart';
import '../../data/models/course_lessons/course_lessons_fetch_response_model.dart';
import '../../data/models/course_reviews/course_reviews_fetch_response_model.dart';
import '../../data/models/enroll_course/enroll_course_response_model.dart';
import '../../data/models/update_lesson_time/update_lesson_time_respose_model.dart';

abstract class CourseRepository {
  Future<DataState<CourseFetchResponseModel>> getCourseFetchRequest(
    CourseFetchRequestParams? params,
  );

  Future<DataState<CourseDetailsFetchResponseModel>>
      getCourseDetailsFetchRequest(
    CourseDetailsFetchRequestParams? params,
  );

  Future<DataState<CourseLessonsFetchResponseModel>>
      getCourseLessonsFetchRequest(
    CourseLessonsFetchRequestParams? params,
  );

  Future<DataState<CourseReviewsFetchResponseModel>>
      getCourseReviewsFetchRequest(
    CourseReviewsFetchRequestParams? params,
  );

  Future<DataState<EnrollCourseResponseModel>> postEnrollCourseRequest(
    EnrollCourseRequestParams? params,
  );

  Future<DataState<UpdateLessonTimeResponseModel>> postUpdateLessonTimeRequest(
    UpdateLessonTimeRequestParams? params,
  );
}
