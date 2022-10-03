part of 'my_course_bloc.dart';

@immutable
abstract class MyCourseState {}

class MyCourseFetchInitial extends MyCourseState {}

class MyCourseFetchInProgress extends MyCourseState {}

class MyCourseFetchSuccess extends MyCourseState {
  MyCourseFetchSuccess(this.courseData);

  final Data? courseData;
}

class MyCourseFetchFailure extends MyCourseState {
  MyCourseFetchFailure(this.error);

  final ApiError error;
}
