part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object?> get props => [];
}

class ProfileInitial extends ProfileState {}

class ProfileInProgress extends ProfileState {}

class ProfileFailure extends ProfileState {
  const ProfileFailure({this.msg});

  final String? msg;

  @override
  List<Object?> get props => [msg];
}

class ProfileFetchSuccess extends ProfileState {
  const ProfileFetchSuccess({this.profile, this.language});

  final ProfileModel? profile;
  final LanguageModel? language;

  @override
  List<Object?> get props => [profile];
}
