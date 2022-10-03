import 'package:injectable/injectable.dart';

import '../../core/params/my_course_fetch_request_params.dart';
import '../../core/resources/data_state.dart';
import '../../core/usecases/usecases.dart';
import '../../data/models/my_course/my_course_fetch_response_model.dart';
import '../repositories/user_repository.dart';

@injectable
class MyCourseFetchUseCase
    implements
        UseCase<DataState<MyCourseFetchResponseModel>,
            MyCourseFetchRequestParams> {
  MyCourseFetchUseCase(this._userRepository);

  final UserRepository _userRepository;

  @override
  Future<DataState<MyCourseFetchResponseModel>> call({
    MyCourseFetchRequestParams? params,
  }) {
    return _userRepository.getMyCourseFetchRequest(params);
  }
}
