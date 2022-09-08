import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/params/course_lessons_fetch_request_params.dart';
import '../../../../core/resources/api_error.dart';
import '../../../../core/resources/data_state.dart';
import '../../../../core/utils/constants.dart';
import '../../../../data/models/course_lessons/course_lessons_fetch_response_model.dart';
import '../../../../domain/usecases/get_course_lessons_fetch_usecase.dart';

part 'lesson_event.dart';
part 'lesson_state.dart';

@injectable
class LessonBloc extends Bloc<LessonEvent, LessonState> {
  LessonBloc(
    this.lessonFetchUseCase,
  ) : super(LessonFetchInitial()) {
    on<LessonFetched>(_onLessonFetched);
  }

  final CourseLessonsFetchUseCase lessonFetchUseCase;

  Future<void> _onLessonFetched(
    LessonFetched event,
    Emitter<LessonState> emit,
  ) async {
    emit(LessonFetchInProgress());
    final dataState = await lessonFetchUseCase(
      params: CourseLessonsFetchRequestParams(
        courseId: '62cfe28220ef7d2084494478',
      ),
    );
    if (dataState is DataSuccess) {
      final res = dataState.data;
      if (dataState.data?.code == ErrorCode.success)
        emit(LessonFetchSuccess(res?.data));
      else
        emit(
          LessonFetchFailure(
            ApiError(errorCode: res?.code, errorMessage: res?.message),
          ),
        );
    }
    if (dataState is DataFailed) {
      emit(
        LessonFetchFailure(
          ApiError(errorMessage: dataState.error?.message),
        ),
      );
    }
  }
}
