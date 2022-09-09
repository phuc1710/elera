import '../../core/params/mentor_courses_fetch_request_params.dart';
import '../../core/params/mentor_fetch_request_params.dart';
import '../../core/params/mentor_reviews_fetch_request_params.dart';
import '../../core/params/mentor_students_fetch_request_params.dart';
import '../../core/resources/data_state.dart';
import '../../data/models/mentor/mentor_fetch_response_model.dart';
import '../../data/models/mentor_courses/mentor_courses_fetch_response_model.dart';
import '../../data/models/mentor_reviews/mentor_reviews_fetch_response_model.dart';
import '../../data/models/mentor_students/mentor_students_fetch_response_model.dart';

abstract class MentorRepository {
  Future<DataState<MentorFetchResponseModel>> getMentorFetchRequest(
    MentorFetchRequestParams? params,
  );

  Future<DataState<MentorCoursesFetchResponseModel>>
      getMentorCoursesFetchRequest(
    MentorCoursesFetchRequestParams? params,
  );

  Future<DataState<MentorStudentsFetchResponseModel>>
      getMentorStudentsFetchRequest(
    MentorStudentsFetchRequestParams? params,
  );

  Future<DataState<MentorReviewsFetchResponseModel>>
      getMentorReviewsFetchRequest(
    MentorReviewsFetchRequestParams? params,
  );
}
