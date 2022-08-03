import 'package:injectable/injectable.dart';

import '../../core/params/mentor_fetch_request_params.dart';
import '../../core/resources/data_state.dart';
import '../../core/usecases/usecases.dart';
import '../../data/models/mentor/mentor_fetch_response_model.dart';
import '../repositories/mentor_repository.dart';

@injectable
class MentorFetchUseCase
    implements
        UseCase<DataState<MentorFetchResponseModel>, MentorFetchRequestParams> {
  MentorFetchUseCase(this._mentorRepository);

  final MentorRepository _mentorRepository;

  @override
  Future<DataState<MentorFetchResponseModel>> call({
    MentorFetchRequestParams? params,
  }) {
    return _mentorRepository.getMentorFetchRequest(params);
  }
}
