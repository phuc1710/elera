part of 'top_mentors_bloc.dart';

abstract class TopMentorsEvent {
  const TopMentorsEvent();
}

class TopMentorsFetched extends TopMentorsEvent {}
