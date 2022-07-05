part of 'invite_friends_bloc.dart';

abstract class InviteFriendsEvent extends Equatable {
  const InviteFriendsEvent();

  @override
  List<Object?> get props => [];
}

class InviteFriendsStarted extends InviteFriendsEvent {}

class InviteFriendsInvited extends InviteFriendsEvent {
  const InviteFriendsInvited({required this.id});

  final String? id;

  @override
  List<Object?> get props => [id];
}
