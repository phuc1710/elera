part of 'mentor_details_bloc.dart';

@immutable
abstract class MentorDetailsEvent {}

class MentorCoursesFetched extends MentorDetailsEvent {}

class MentorStudentsFetched extends MentorDetailsEvent {}
