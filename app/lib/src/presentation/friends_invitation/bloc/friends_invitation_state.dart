part of 'friends_invitation_bloc.dart';

abstract class FriendsInvitationState extends Equatable {
  const FriendsInvitationState();

  @override
  List<Object?> get props => [];
}

class FriendsInvitationInitial extends FriendsInvitationState {}

class FriendsInvitationInProgress extends FriendsInvitationState {}

class FriendsInvitationFailure extends FriendsInvitationState {
  const FriendsInvitationFailure({this.msg});

  final String? msg;

  @override
  List<Object?> get props => [msg];
}

class FriendsInvitationFetchSuccess extends FriendsInvitationState {
  const FriendsInvitationFetchSuccess({required this.friends});

  final List<FriendModel?> friends;

  @override
  List<Object?> get props => [friends];
}

class FriendsInvitationInviteSuccess extends FriendsInvitationState {
  const FriendsInvitationInviteSuccess({this.id});

  final String? id;

  @override
  List<Object?> get props => [id];
}
