part of 'my_complete_course_bloc.dart';

@immutable
abstract class MyCompleteCourseState {}

class MyCompleteCourseInitial extends MyCompleteCourseState {}

class MyCompleteCourseFetchInProgress extends MyCompleteCourseState {}

class MyCompleteCourseFetchSuccess extends MyCompleteCourseState {
  MyCompleteCourseFetchSuccess(this.courseData);

  final Data? courseData;
}

class MyCompleteCourseFetchFailure extends MyCompleteCourseState {
  MyCompleteCourseFetchFailure(this.error);

  final ApiError error;
}
