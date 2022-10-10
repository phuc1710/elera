import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../core/params/update_lesson_time_request_params.dart';
import '../../../../core/resources/api_error.dart';
import '../../../../core/resources/data_state.dart';
import '../../../../core/utils/constants.dart';
import '../../../../data/models/update_lesson_time/update_lesson_time_respose_model.dart';
import '../../../../domain/usecases/post_update_lesson_time_usecase.dart';

part 'course_video_event.dart';
part 'course_video_state.dart';

@injectable
class CourseVideoBloc extends Bloc<CourseVideoEvent, CourseVideoState> {
  CourseVideoBloc(this.postUpdateLessonTimeUseCase)
      : super(CourseVideoTimeUpdateInitial()) {
    on<CourseVideoTimeUpdated>(_onCourseVideoTimeUpdated);
  }

  final PostUpdateLessonTimeUseCase postUpdateLessonTimeUseCase;

  Future<void> _onCourseVideoTimeUpdated(
    CourseVideoTimeUpdated event,
    Emitter<CourseVideoState> emit,
  ) async {
    emit(CourseVideoTimeUpdateInProgress());
    final dataState = await postUpdateLessonTimeUseCase(
      params: UpdateLessonTimeRequestParams(
        event.courseId,
        event.lessonId,
        event.time,
      ),
    );
    if (dataState is DataSuccess) {
      final res = dataState.data;
      if (dataState.data?.code == ErrorCode.success)
        emit(CourseVideoTimeUpdateSuccess(res?.data));
      else
        emit(
          CourseVideoTimeUpdateFailure(
            ApiError(errorCode: res?.code, errorMessage: res?.message),
          ),
        );
    }
    if (dataState is DataFailed) {
      emit(
        CourseVideoTimeUpdateFailure(
          ApiError(errorMessage: dataState.error?.message),
        ),
      );
    }
  }
}
