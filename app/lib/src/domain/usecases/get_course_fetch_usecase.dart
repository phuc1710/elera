import 'package:injectable/injectable.dart';

import '../../core/params/course_fetch_request_params.dart';
import '../../core/resources/data_state.dart';
import '../../core/usecases/usecases.dart';
import '../../data/models/course/course_fetch_response_model.dart';
import '../repositories/course_repository.dart';

@injectable
class CourseFetchUseCase
    implements
        UseCase<DataState<CourseFetchResponseModel>, CourseFetchRequestParams> {
  CourseFetchUseCase(this._courseRepository);

  final CourseRepository _courseRepository;

  @override
  Future<DataState<CourseFetchResponseModel>> call({
    CourseFetchRequestParams? params,
  }) {
    return _courseRepository.getCourseFetchRequest(params);
  }
}
