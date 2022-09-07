import 'package:injectable/injectable.dart';

import '../../core/params/mentor_reviews_fetch_request_params.dart';
import '../../core/resources/data_state.dart';
import '../../core/usecases/usecases.dart';
import '../../data/models/mentor_reviews/mentor_reviews_fetch_response_model.dart';
import '../repositories/mentor_repository.dart';

@injectable
class MentorReviewsFetchUseCase
    implements
        UseCase<DataState<MentorReviewsFetchResponseModel>,
            MentorReviewsFetchRequestParams> {
  MentorReviewsFetchUseCase(this._courseRepository);

  final MentorRepository _courseRepository;

  @override
  Future<DataState<MentorReviewsFetchResponseModel>> call({
    MentorReviewsFetchRequestParams? params,
  }) {
    return _courseRepository.getMentorReviewsFetchRequest(params);
  }
}
