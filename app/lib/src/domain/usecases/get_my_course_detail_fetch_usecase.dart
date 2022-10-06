import 'package:injectable/injectable.dart';

import '../../core/params/my_course_detail_fetch_request_params.dart';
import '../../core/resources/data_state.dart';
import '../../core/usecases/usecases.dart';
import '../../data/models/my_course_detail/my_course_detail_fetch_response_model.dart';
import '../repositories/user_repository.dart';

@injectable
class MyCourseDetailFetchUseCase
    implements
        UseCase<DataState<MyCourseDetailFetchResponseModel>,
            MyCourseDetailFetchRequestParams> {
  MyCourseDetailFetchUseCase(this._userRepository);

  final UserRepository _userRepository;

  @override
  Future<DataState<MyCourseDetailFetchResponseModel>> call({
    MyCourseDetailFetchRequestParams? params,
  }) {
    return _userRepository.getMyCourseDetailFetchRequest(params);
  }
}
