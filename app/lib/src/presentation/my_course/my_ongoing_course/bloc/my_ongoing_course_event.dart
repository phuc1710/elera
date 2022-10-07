part of 'my_ongoing_course_bloc.dart';

@immutable
abstract class MyOngoingCourseEvent {}

class MyOngoingCourseFetched extends MyOngoingCourseEvent {
  MyOngoingCourseFetched(this.courseId);

  final String courseId;
}
