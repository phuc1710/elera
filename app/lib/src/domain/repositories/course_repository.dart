import '../../core/params/course_details_fetch_request_params.dart';
import '../../core/params/course_fetch_request_params.dart';
import '../../core/params/course_lessons_fetch_request_params.dart';
import '../../core/resources/data_state.dart';
import '../../data/models/course/course_fetch_response_model.dart';
import '../../data/models/course_details/course_details_fetch_response_model.dart';
import '../../data/models/course_lessons/course_lessons_fetch_response_model.dart';

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
}
