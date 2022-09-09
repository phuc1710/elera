import 'package:injectable/injectable.dart';

import '../../core/params/course_reviews_fetch_request_params.dart';
import '../../core/resources/data_state.dart';
import '../../core/usecases/usecases.dart';
import '../../data/models/course_reviews/course_reviews_fetch_response_model.dart';
import '../repositories/course_repository.dart';

@injectable
class CourseReviewsFetchUseCase
    implements
        UseCase<DataState<CourseReviewsFetchResponseModel>,
            CourseReviewsFetchRequestParams> {
  CourseReviewsFetchUseCase(this._courseRepository);

  final CourseRepository _courseRepository;

  @override
  Future<DataState<CourseReviewsFetchResponseModel>> call({
    CourseReviewsFetchRequestParams? params,
  }) {
    return _courseRepository.getCourseReviewsFetchRequest(params);
  }
}
