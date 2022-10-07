part of 'my_complete_course_bloc.dart';

@immutable
abstract class MyCompleteCourseEvent {}

class MyCompleteCourseFetched extends MyCompleteCourseEvent {
  MyCompleteCourseFetched(this.courseId);

  final String courseId;
}
