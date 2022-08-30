import 'package:injectable/injectable.dart';

import '../../core/params/course_lessons_fetch_request_params.dart';
import '../../core/resources/data_state.dart';
import '../../core/usecases/usecases.dart';
import '../../data/models/course_lessons/course_lessons_fetch_response_model.dart';
import '../repositories/course_repository.dart';

@injectable
class CourseLessonsFetchUseCase
    implements
        UseCase<DataState<CourseLessonsFetchResponseModel>,
            CourseLessonsFetchRequestParams> {
  CourseLessonsFetchUseCase(this._courseRepository);

  final CourseRepository _courseRepository;

  @override
  Future<DataState<CourseLessonsFetchResponseModel>> call({
    CourseLessonsFetchRequestParams? params,
  }) {
    return _courseRepository.getCourseLessonsFetchRequest(params);
  }
}
