part of 'mentor_details_bloc.dart';

@immutable
abstract class MentorDetailsState {}

class MentorDetailsFetchInitial extends MentorDetailsState {}

class MentorCoursesFetchInProgress extends MentorDetailsState {}

class MentorCoursesFetchSuccess extends MentorDetailsState {
  MentorCoursesFetchSuccess(this.mentorCourseData);

  final mentor_course.Data? mentorCourseData;
}

class MentorCoursesFetchFailure extends MentorDetailsState {
  MentorCoursesFetchFailure(this.error);

  final ApiError error;
}

class MentorStudentsFetchInProgress extends MentorDetailsState {}

class MentorStudentsFetchSuccess extends MentorDetailsState {
  MentorStudentsFetchSuccess(this.mentorStudentData);

  final mentor_student.Data? mentorStudentData;
}

class MentorStudentsFetchFailure extends MentorDetailsState {
  MentorStudentsFetchFailure(this.error);

  final ApiError error;
}
