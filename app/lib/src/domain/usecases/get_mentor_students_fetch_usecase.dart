import 'package:injectable/injectable.dart';

import '../../core/params/mentor_students_fetch_request_params.dart';
import '../../core/resources/data_state.dart';
import '../../core/usecases/usecases.dart';
import '../../data/models/mentor_students/mentor_students_fetch_response_model.dart';
import '../repositories/mentor_repository.dart';

@injectable
class MentorStudentsFetchUseCase
    implements
        UseCase<DataState<MentorStudentsFetchResponseModel>,
            MentorStudentsFetchRequestParams> {
  MentorStudentsFetchUseCase(this._courseRepository);

  final MentorRepository _courseRepository;

  @override
  Future<DataState<MentorStudentsFetchResponseModel>> call({
    MentorStudentsFetchRequestParams? params,
  }) {
    return _courseRepository.getMentorStudentsFetchRequest(params);
  }
}
