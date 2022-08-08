part of 'friends_invitation_bloc.dart';

abstract class FriendsInvitationEvent extends Equatable {
  const FriendsInvitationEvent();

  @override
  List<Object?> get props => [];
}

class FriendsInvitationStarted extends FriendsInvitationEvent {}

class FriendsInvitationInvited extends FriendsInvitationEvent {
  const FriendsInvitationInvited({required this.id});

  final String? id;

  @override
  List<Object?> get props => [id];
}
