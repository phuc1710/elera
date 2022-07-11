import 'package:injectable/injectable.dart';

import '../../core/params/contact_selection_request_params.dart';
import '../../core/resources/data_state.dart';
import '../../core/usecases/usecases.dart';
import '../../data/models/contact_selection/contact_selection_response_model.dart';
import '../repositories/user_repository.dart';

@injectable
class ContactSelectionUseCase
    implements
        UseCase<DataState<ContactSelectionResponseModel>,
            ContactSelectionRequestParams> {
  ContactSelectionUseCase(this._userRepository);

  final UserRepository _userRepository;

  @override
  Future<DataState<ContactSelectionResponseModel>> call({
    ContactSelectionRequestParams? params,
  }) {
    return _userRepository.postContactSelectionRequest(params);
  }
}
