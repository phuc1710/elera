part of 'fill_your_profile_bloc.dart';

abstract class FillYourProfileState {
  FillYourProfileState();
}

class FillYourProfileInitial extends FillYourProfileState {
  FillYourProfileInitial();
}

class FillYourProfileLoading extends FillYourProfileState {
  FillYourProfileLoading();
}

class FillYourProfileSuccess extends FillYourProfileState {
  FillYourProfileSuccess();
}

class FillYourProfileFailed extends FillYourProfileState {
  FillYourProfileFailed(this.error);

  final ApiError error;
}
