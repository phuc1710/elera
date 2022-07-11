import '../../core/params/course_fetch_request_params.dart';
import '../../core/resources/data_state.dart';
import '../../data/models/course/course_response_model.dart';

abstract class CourseRepository {
  Future<DataState<CourseFetchResponseModel>> getCourseFetchRequest(
    CourseFetchRequestParams? params,
  );
}
