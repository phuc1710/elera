part of 'lesson_bloc.dart';

@immutable
abstract class LessonEvent {}

class LessonFetched extends LessonEvent {
  LessonFetched(this.rating);

  final String rating;
}
