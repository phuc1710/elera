import 'package:injectable/injectable.dart';

import '../../core/params/mentor_details_fetch_request_params.dart';
import '../../core/resources/data_state.dart';
import '../../core/usecases/usecases.dart';
import '../../data/models/mentor_details/mentor_details_fetch_response_model.dart';
import '../repositories/mentor_repository.dart';

@injectable
class MentorDetailsFetchUseCase
    implements
        UseCase<DataState<MentorDetailsFetchResponseModel>,
            MentorDetailsFetchRequestParams> {
  MentorDetailsFetchUseCase(this._courseRepository);

  final MentorRepository _courseRepository;

  @override
  Future<DataState<MentorDetailsFetchResponseModel>> call({
    MentorDetailsFetchRequestParams? params,
  }) {
    return _courseRepository.getMentorDetailsFetchRequest(params);
  }
}
