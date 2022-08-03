import 'package:injectable/injectable.dart';

import '../../core/params/new_card_params.dart';
import '../../core/resources/data_state.dart';
import '../../core/usecases/usecases.dart';
import '../../data/models/general_response/general_response_model.dart';
import '../repositories/user_repository.dart';

@injectable
class AddNewCardUseCase
    implements UseCase<DataState<GeneralResponseModel?>, NewCardParams> {
  AddNewCardUseCase(this._userRepository);

  final UserRepository _userRepository;

  @override
  Future<DataState<GeneralResponseModel?>> call({
    required NewCardParams params,
  }) {
    return _userRepository.addNewCard(params);
  }
}
