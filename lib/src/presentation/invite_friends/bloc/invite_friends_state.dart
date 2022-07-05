part of 'invite_friends_bloc.dart';

abstract class InviteFriendsState extends Equatable {
  const InviteFriendsState();

  @override
  List<Object?> get props => [];
}

class InviteFriendsInitial extends InviteFriendsState {}

class InviteFriendsInProgress extends InviteFriendsState {}

class InviteFriendsFailure extends InviteFriendsState {
  const InviteFriendsFailure({this.msg});

  final String? msg;

  @override
  List<Object?> get props => [msg];
}

class InviteFriendsFetchSuccess extends InviteFriendsState {
  const InviteFriendsFetchSuccess({required this.friends});

  final List<FriendModel?> friends;

  @override
  List<Object?> get props => [friends];
}

class InviteFriendsInviteSuccess extends InviteFriendsState {
  const InviteFriendsInviteSuccess({this.msg});

  final String? msg;

  @override
  List<Object?> get props => [msg];
}
