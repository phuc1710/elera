import 'package:injectable/injectable.dart';

import '../../core/params/friend_invite_params.dart';
import '../../core/resources/data_state.dart';
import '../../core/usecases/usecases.dart';
import '../../data/models/friends/friend_response_model.dart';
import '../repositories/user_repository.dart';

@injectable
class InviteFriendUseCase
    implements UseCase<DataState<FriendResponseModel?>, FriendInviteParams> {
  InviteFriendUseCase(this._userRepository);

  final UserRepository _userRepository;

  @override
  Future<DataState<FriendResponseModel?>> call({
    required FriendInviteParams params,
  }) {
    return _userRepository.inviteFriend(params);
  }
}
