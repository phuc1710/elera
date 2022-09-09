import 'package:injectable/injectable.dart';

import '../../core/params/enroll_course_request_params.dart';
import '../../core/resources/data_state.dart';
import '../../core/usecases/usecases.dart';
import '../../data/models/enroll_course/enroll_course_response_model.dart';
import '../repositories/course_repository.dart';

@injectable
class PostEnrollCourseUseCase
    implements
        UseCase<DataState<EnrollCourseResponseModel>,
            EnrollCourseRequestParams> {
  PostEnrollCourseUseCase(this._courseRepository);

  final CourseRepository _courseRepository;

  @override
  Future<DataState<EnrollCourseResponseModel>> call({
    EnrollCourseRequestParams? params,
  }) {
    return _courseRepository.postEnrollCourseRequest(params);
  }
}
