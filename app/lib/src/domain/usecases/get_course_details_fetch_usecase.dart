import 'package:injectable/injectable.dart';

import '../../core/params/course_details_fetch_request_params.dart';
import '../../core/resources/data_state.dart';
import '../../core/usecases/usecases.dart';
import '../../data/models/course_details/course_details_fetch_response_model.dart';
import '../repositories/course_repository.dart';

@injectable
class CourseDetailsFetchUseCase
    implements
        UseCase<DataState<CourseDetailsFetchResponseModel>,
            CourseDetailsFetchRequestParams> {
  CourseDetailsFetchUseCase(this._courseRepository);

  final CourseRepository _courseRepository;

  @override
  Future<DataState<CourseDetailsFetchResponseModel>> call({
    CourseDetailsFetchRequestParams? params,
  }) {
    return _courseRepository.getCourseDetailsFetchRequest(params);
  }
}
