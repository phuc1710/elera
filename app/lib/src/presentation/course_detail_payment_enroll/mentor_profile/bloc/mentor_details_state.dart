part of 'mentor_details_bloc.dart';

@immutable
abstract class MentorDetailsState {}

class MentorDetailsFetchInitial extends MentorDetailsState {}

class MentorDetailsFetchInProgress extends MentorDetailsState {}

class MentorDetailsFetchSuccess extends MentorDetailsState {
  MentorDetailsFetchSuccess(this.mentorData);

  final Data? mentorData;
}

class MentorDetailsFetchFailure extends MentorDetailsState {
  MentorDetailsFetchFailure(this.error);

  final ApiError error;
}
