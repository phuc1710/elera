part of 'edit_profile_bloc.dart';

abstract class EditProfileEvent extends Equatable {
  const EditProfileEvent();

  @override
  List<Object?> get props => [];
}

class EditProfileStarted extends EditProfileEvent {}

class EditProfileUpdated extends EditProfileEvent {
  const EditProfileUpdated(this.params);

  final UpdateProfileParams params;

  @override
  List<Object?> get props => [params];
}
