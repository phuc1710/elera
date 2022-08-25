part of 'course_details_bloc.dart';

@immutable
abstract class CourseDetailsState {}

class CourseDetailsFetchInitial extends CourseDetailsState {}

class CourseDetailsFetchInProgress extends CourseDetailsState {}

class CourseDetailsFetchSuccess extends CourseDetailsState {
  CourseDetailsFetchSuccess(this.courseData);

  final Datum? courseData;
}

class CourseDetailsFetchFailure extends CourseDetailsState {
  CourseDetailsFetchFailure(this.error);

  final ApiError error;
}
