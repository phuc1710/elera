import 'package:injectable/injectable.dart';

import '../../core/params/mentor_courses_fetch_request_params.dart';
import '../../core/resources/data_state.dart';
import '../../core/usecases/usecases.dart';
import '../../data/models/mentor_courses/mentor_courses_fetch_response_model.dart';
import '../repositories/mentor_repository.dart';

@injectable
class MentorCoursesFetchUseCase
    implements
        UseCase<DataState<MentorCoursesFetchResponseModel>,
            MentorCoursesFetchRequestParams> {
  MentorCoursesFetchUseCase(this._courseRepository);

  final MentorRepository _courseRepository;

  @override
  Future<DataState<MentorCoursesFetchResponseModel>> call({
    MentorCoursesFetchRequestParams? params,
  }) {
    return _courseRepository.getMentorCoursesFetchRequest(params);
  }
}
