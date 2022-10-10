part of 'course_video_bloc.dart';

@immutable
abstract class CourseVideoEvent {}

class CourseVideoTimeUpdated extends CourseVideoEvent {
  CourseVideoTimeUpdated(this.courseId, this.lessonId, this.time);

  final String? courseId;
  final String? lessonId;
  final String? time;
}
