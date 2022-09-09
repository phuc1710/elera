part of 'lesson_bloc.dart';

@immutable
abstract class LessonState {}

class LessonFetchInitial extends LessonState {}

class LessonFetchInProgress extends LessonState {}

class LessonFetchSuccess extends LessonState {
  LessonFetchSuccess(this.lessonData);

  final Data? lessonData;
}

class LessonFetchFailure extends LessonState {
  LessonFetchFailure(this.error);

  final ApiError error;
}
