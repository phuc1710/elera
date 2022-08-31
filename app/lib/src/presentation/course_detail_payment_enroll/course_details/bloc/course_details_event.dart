part of 'course_details_bloc.dart';

@immutable
abstract class CourseDetailsEvent {}

class CourseDetailsFetched extends CourseDetailsEvent {}

class CourseLessonsFetched extends CourseDetailsEvent {}

class CourseReviewsFetched extends CourseDetailsEvent {
  CourseReviewsFetched(this.rating);

  final String rating;
}
