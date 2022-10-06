part of 'my_ongoing_course_bloc.dart';

@immutable
abstract class MyOngoingCourseState {}

class MyOngoingCourseInitial extends MyOngoingCourseState {}

class MyOngoingCourseFetchInProgress extends MyOngoingCourseState {}

class MyOngoingCourseFetchSuccess extends MyOngoingCourseState {
  MyOngoingCourseFetchSuccess(this.courseData);

  final Data? courseData;
}

class MyOngoingCourseFetchFailure extends MyOngoingCourseState {
  MyOngoingCourseFetchFailure(this.error);

  final ApiError error;
}
