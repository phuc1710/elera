part of 'course_details_bloc.dart';

@immutable
abstract class CourseDetailsState {}

class CourseDetailsFetchInitial extends CourseDetailsState {}

class CourseDetailsFetchInProgress extends CourseDetailsState {}

class CourseDetailsFetchSuccess extends CourseDetailsState {
  CourseDetailsFetchSuccess(this.courseData);

  final Data? courseData;
}

class CourseDetailsFetchFailure extends CourseDetailsState {
  CourseDetailsFetchFailure(this.error);

  final ApiError error;
}

class CourseLessonsFetchInitial extends CourseDetailsState {}

class CourseLessonsFetchInProgress extends CourseDetailsState {}

class CourseLessonsFetchSuccess extends CourseDetailsState {
  CourseLessonsFetchSuccess(this.lessonData);

  final lesson.Data? lessonData;
}

class CourseLessonsFetchFailure extends CourseDetailsState {
  CourseLessonsFetchFailure(this.error);

  final ApiError error;
}
