import 'package:injectable/injectable.dart';

import '../../core/params/update_lesson_time_request_params.dart';
import '../../core/resources/data_state.dart';
import '../../core/usecases/usecases.dart';
import '../../data/models/update_lesson_time/update_lesson_time_respose_model.dart';
import '../repositories/course_repository.dart';

@injectable
class PostUpdateLessonTimeUseCase
    implements
        UseCase<DataState<UpdateLessonTimeResponseModel>,
            UpdateLessonTimeRequestParams> {
  PostUpdateLessonTimeUseCase(this._courseRepository);

  final CourseRepository _courseRepository;

  @override
  Future<DataState<UpdateLessonTimeResponseModel>> call({
    UpdateLessonTimeRequestParams? params,
  }) {
    return _courseRepository.postUpdateLessonTimeRequest(params);
  }
}
