import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../core/params/friend_invite_params.dart';
import '../../../core/resources/data_state.dart';
import '../../../core/utils/constants.dart';
import '../../../data/models/friends/friend_response_model.dart';
import '../../../domain/usecases/get_invite_friends_usecase.dart';
import '../../../domain/usecases/invite_friend_usecase.dart';

part 'friends_invitation_event.dart';
part 'friends_invitation_state.dart';

@injectable
class FriendsInvitationBloc
    extends Bloc<FriendsInvitationEvent, FriendsInvitationState> {
  FriendsInvitationBloc(
    this._getInviteFriendsUC,
    this._inviteFriendUC,
  ) : super(FriendsInvitationInitial()) {
    on<FriendsInvitationEvent>((event, emit) {});

    on<FriendsInvitationStarted>(_fetchFriends);

    on<FriendsInvitationInvited>(_inviteFriend);
  }

  final GetInviteFriendsUseCase _getInviteFriendsUC;
  final InviteFriendUseCase _inviteFriendUC;

  Future<void> _fetchFriends(
    FriendsInvitationStarted event,
    Emitter<FriendsInvitationState> emit,
  ) async {
    emit(FriendsInvitationInProgress());

    final dataState = await _getInviteFriendsUC();
    if (dataState is DataSuccess) {
      final res = dataState.data;
      if (res?.status == StatusCode.success) {
        emit(FriendsInvitationFetchSuccess(friends: res?.data?.friends ?? []));
      } else {
        emit(FriendsInvitationFailure(msg: res?.message));
      }
    }
    if (dataState is DataFailed) {
      emit(FriendsInvitationFailure(msg: dataState.error?.message));
    }
  }

  Future<void> _inviteFriend(
    FriendsInvitationInvited event,
    Emitter<FriendsInvitationState> emit,
  ) async {
    emit(FriendsInvitationInProgress());

    final dataState =
        await _inviteFriendUC(params: FriendInviteParams(id: event.id));
    if (dataState is DataSuccess) {
      final res = dataState.data;
      if (res?.status == StatusCode.success) {
        emit(FriendsInvitationInviteSuccess(id: event.id));
      } else {
        emit(FriendsInvitationFailure(msg: res?.message));
      }
    }
    if (dataState is DataFailed) {
      emit(FriendsInvitationFailure(msg: dataState.error?.message));
    }
  }
}
