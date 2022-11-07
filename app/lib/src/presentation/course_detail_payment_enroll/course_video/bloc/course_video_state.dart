part of 'course_video_bloc.dart';

@immutable
abstract class CourseVideoState {}

class CourseVideoTimeUpdateInitial extends CourseVideoState {}

class CourseVideoTimeUpdateInProgress extends CourseVideoState {}

class CourseVideoTimeUpdateSuccess extends CourseVideoState {
  CourseVideoTimeUpdateSuccess(this.data);

  final Data? data;
}

class CourseVideoTimeUpdateFailure extends CourseVideoState {
  CourseVideoTimeUpdateFailure(this.error);

  final ApiError? error;
}
