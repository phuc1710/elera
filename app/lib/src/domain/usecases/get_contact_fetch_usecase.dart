import 'package:injectable/injectable.dart';

import '../../core/params/contact_fetch_request_params.dart';
import '../../core/resources/data_state.dart';
import '../../core/usecases/usecases.dart';
import '../../data/models/contact_selection/contact_fetch_response_model.dart';
import '../repositories/user_repository.dart';

@injectable
class ContactFetchUseCase
    implements
        UseCase<DataState<ContactFetchResponseModel>,
            ContactFetchRequestParams> {
  ContactFetchUseCase(this._userRepository);

  final UserRepository _userRepository;

  @override
  Future<DataState<ContactFetchResponseModel>> call({
    ContactFetchRequestParams? params,
  }) {
    return _userRepository.getContactFetchRequest(params);
  }
}
