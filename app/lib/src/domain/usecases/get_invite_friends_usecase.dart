import 'package:injectable/injectable.dart';

import '../../core/resources/data_state.dart';
import '../../core/usecases/usecases.dart';
import '../../data/models/friends/friend_response_model.dart';
import '../repositories/user_repository.dart';

@injectable
class GetInviteFriendsUseCase
    implements UseCase<DataState<FriendResponseModel?>, void> {
  GetInviteFriendsUseCase(this._userRepository);

  final UserRepository _userRepository;

  @override
  Future<DataState<FriendResponseModel?>> call({params}) {
    return _userRepository.getInviteFriends();
  }
}
