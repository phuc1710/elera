part of 'course_bloc.dart';

abstract class CourseEvent {
  const CourseEvent();
}

class CourseFetched extends CourseEvent {}

class CourseBookmarkAddRequested extends CourseEvent {
  CourseBookmarkAddRequested(this.courseList, this.tag, this.name);

  final List<Course> courseList;
  final String tag;
  final String name;
}

class CourseBookmarkRemoveRequested extends CourseEvent {
  CourseBookmarkRemoveRequested(this.courseList, this.tag, this.name);

  final List<Course> courseList;
  final String tag;
  final String name;
}
