part of 'course_bloc.dart';

abstract class CourseState {
  const CourseState();
}

class CourseFetchInitial extends CourseState {
  CourseFetchInitial();
}

class CourseFetchInProgress extends CourseState {
  CourseFetchInProgress();
}

class CourseFetchSuccess extends CourseState {
  CourseFetchSuccess(this.data);

  final Data? data;
}

class CourseFetchFailure extends CourseState {
  CourseFetchFailure(this.error);

  final ApiError error;
}

class BookmarkAdditionInProgress extends CourseState {
  BookmarkAdditionInProgress();
}

class BookmarkAdditionSuccess extends CourseState {
  BookmarkAdditionSuccess(this.courseList);

  final List<CourseList> courseList;
}

class BookmarkAdditionFailure extends CourseState {
  BookmarkAdditionFailure(this.error);

  final ApiError error;
}

class BookmarkRemovalInProgress extends CourseState {
  BookmarkRemovalInProgress();
}

class BookmarkRemovalSuccess extends CourseState {
  BookmarkRemovalSuccess(this.courseList);

  final List<CourseList> courseList;
}

class BookmarkRemovalFailure extends CourseState {
  BookmarkRemovalFailure(this.error);

  final ApiError error;
}
