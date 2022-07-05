import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../core/network/api.dart';
import '../../../core/params/friend_invite_params.dart';
import '../../../core/utils/constants.dart';
import '../../../data/models/friends/friend_response_model.dart';

part 'invite_friends_event.dart';
part 'invite_friends_state.dart';

class InviteFriendsBloc extends Bloc<InviteFriendsEvent, InviteFriendsState> {
  InviteFriendsBloc() : super(InviteFriendsInitial()) {
    on<InviteFriendsEvent>((event, emit) {});

    on<InviteFriendsStarted>(_fetchFriends);

    on<InviteFriendsInvited>(_inviteFriend);
  }

  Future<void> _fetchFriends(
    InviteFriendsStarted event,
    Emitter<InviteFriendsState> emit,
  ) async {
    emit(InviteFriendsInProgress());
    try {
      final res = await Api.getInviteFriends();
      if (res?.status == StatusCode.success) {
        emit(InviteFriendsFetchSuccess(friends: res?.data?.friends ?? []));
      } else {
        emit(InviteFriendsFailure(msg: res?.message));
      }
    } catch (_) {
      emit(const InviteFriendsFailure());
    }
  }

  Future<void> _inviteFriend(
    InviteFriendsInvited event,
    Emitter<InviteFriendsState> emit,
  ) async {
    emit(InviteFriendsInProgress());
    try {
      final res = await Api.inviteFriend(FriendInviteParams(id: event.id));
      if (res?.status == StatusCode.success) {
        emit(InviteFriendsInviteSuccess(msg: res?.message));
      } else {
        emit(InviteFriendsFailure(msg: res?.message));
      }
    } catch (_) {
      emit(const InviteFriendsFailure());
    }
  }
}
