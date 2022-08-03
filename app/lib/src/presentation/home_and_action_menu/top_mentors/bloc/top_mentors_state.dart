part of 'top_mentors_bloc.dart';

abstract class TopMentorsState {
  const TopMentorsState();
}

class TopMentorsFetchInitial extends TopMentorsState {
  TopMentorsFetchInitial();
}

class TopMentorsFetchInProgress extends TopMentorsState {
  TopMentorsFetchInProgress();
}

class TopMentorsFetchSuccess extends TopMentorsState {
  TopMentorsFetchSuccess(this.data);

  final Data? data;
}

class TopMentorsFetchFailure extends TopMentorsState {
  TopMentorsFetchFailure(this.error);

  final ApiError error;
}
