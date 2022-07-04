part of 'edit_profile_bloc.dart';

abstract class EditProfileState extends Equatable {
  const EditProfileState();

  @override
  List<Object?> get props => [];
}

class EditProfileInitial extends EditProfileState {}

class EditProfileInProgress extends EditProfileState {}

class EditProfileFailure extends EditProfileState {
  const EditProfileFailure({this.msg});

  final String? msg;

  @override
  List<Object?> get props => [msg];
}

class EditProfileLoadSuccess extends EditProfileState {
  const EditProfileLoadSuccess(this.data);

  final EditProfileDataModel? data;

  @override
  List<Object?> get props => [data];
}

class EditProfileUpdateSuccess extends EditProfileState {
  const EditProfileUpdateSuccess(this.msg);

  final String? msg;

  @override
  List<Object?> get props => [msg];
}
