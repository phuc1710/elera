import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../core/network/api.dart';
import '../../../core/params/friend_invite_params.dart';
import '../../../core/utils/constants.dart';
import '../../../data/models/friends/friend_response_model.dart';

part 'friends_invitation_event.dart';
part 'friends_invitation_state.dart';

class FriendsInvitationBloc
    extends Bloc<FriendsInvitationEvent, FriendsInvitationState> {
  FriendsInvitationBloc() : super(FriendsInvitationInitial()) {
    on<FriendsInvitationEvent>((event, emit) {});

    on<FriendsInvitationStarted>(_fetchFriends);

    on<FriendsInvitationInvited>(_inviteFriend);
  }

  Future<void> _fetchFriends(
    FriendsInvitationStarted event,
    Emitter<FriendsInvitationState> emit,
  ) async {
    emit(FriendsInvitationInProgress());
    try {
      final res = await Api.getInviteFriends();
      if (res?.status == StatusCode.success) {
        emit(FriendsInvitationFetchSuccess(friends: res?.data?.friends ?? []));
      } else {
        emit(FriendsInvitationFailure(msg: res?.message));
      }
    } catch (_) {
      emit(const FriendsInvitationFailure());
    }
  }

  Future<void> _inviteFriend(
    FriendsInvitationInvited event,
    Emitter<FriendsInvitationState> emit,
  ) async {
    emit(FriendsInvitationInProgress());
    try {
      final res = await Api.inviteFriend(FriendInviteParams(id: event.id));
      if (res?.status == StatusCode.success) {
        emit(FriendsInvitationInviteSuccess(id: event.id));
      } else {
        emit(FriendsInvitationFailure(msg: res?.message));
      }
    } catch (_) {
      emit(const FriendsInvitationFailure());
    }
  }
}
