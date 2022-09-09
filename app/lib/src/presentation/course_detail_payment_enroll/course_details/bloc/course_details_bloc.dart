import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../core/params/course_details_fetch_request_params.dart';
import '../../../../core/params/course_lessons_fetch_request_params.dart';
import '../../../../core/params/course_reviews_fetch_request_params.dart';
import '../../../../core/resources/api_error.dart';
import '../../../../core/resources/data_state.dart';
import '../../../../core/utils/constants.dart';
import '../../../../data/models/course_details/course_details_fetch_response_model.dart';
import '../../../../data/models/course_lessons/course_lessons_fetch_response_model.dart'
    as lesson;
import '../../../../data/models/course_reviews/course_reviews_fetch_response_model.dart'
    as review;
import '../../../../domain/usecases/get_course_details_fetch_usecase.dart';
import '../../../../domain/usecases/get_course_lessons_fetch_usecase.dart';
import '../../../../domain/usecases/get_course_reviews_fetch_usecase.dart';

part 'course_details_event.dart';
part 'course_details_state.dart';

@injectable
class CourseDetailsBloc extends Bloc<CourseDetailsEvent, CourseDetailsState> {
  CourseDetailsBloc(
    this.courseDetailsFetchUseCase,
    this.courseLessonsFetchUseCase,
    this.courseReviewsFetchUseCase,
  ) : super(CourseDetailsFetchInitial()) {
    on<CourseDetailsFetched>(_onCourseDetailsFetched);
    on<CourseLessonsFetched>(_onCourseLessonsFetched);
    on<CourseReviewsFetched>(_onCourseReviewsFetched);
  }

  final CourseDetailsFetchUseCase courseDetailsFetchUseCase;
  final CourseLessonsFetchUseCase courseLessonsFetchUseCase;
  final CourseReviewsFetchUseCase courseReviewsFetchUseCase;

  Future<void> _onCourseDetailsFetched(
    CourseDetailsFetched event,
    Emitter<CourseDetailsState> emit,
  ) async {
    emit(CourseDetailsFetchInProgress());
    final dataState = await courseDetailsFetchUseCase(
      params:
          CourseDetailsFetchRequestParams(courseId: '62cfe28220ef7d2084494478'),
    );
    if (dataState is DataSuccess) {
      final res = dataState.data;
      if (dataState.data?.code == ErrorCode.success)
        emit(CourseDetailsFetchSuccess(res?.data));
      else
        emit(
          CourseDetailsFetchFailure(
            ApiError(errorCode: res?.code, errorMessage: res?.message),
          ),
        );
    }
    if (dataState is DataFailed) {
      emit(
        CourseDetailsFetchFailure(
          ApiError(errorMessage: dataState.error?.message),
        ),
      );
    }
  }

  Future<void> _onCourseLessonsFetched(
    CourseLessonsFetched event,
    Emitter<CourseDetailsState> emit,
  ) async {
    emit(CourseLessonsFetchInProgress());
    final dataState = await courseLessonsFetchUseCase(
      params:
          CourseLessonsFetchRequestParams(courseId: '62cfe28220ef7d2084494478'),
    );
    if (dataState is DataSuccess) {
      final res = dataState.data;
      if (dataState.data?.code == ErrorCode.success)
        emit(CourseLessonsFetchSuccess(res?.data));
      else
        emit(
          CourseLessonsFetchFailure(
            ApiError(errorCode: res?.code, errorMessage: res?.message),
          ),
        );
    }
    if (dataState is DataFailed) {
      emit(
        CourseLessonsFetchFailure(
          ApiError(errorMessage: dataState.error?.message),
        ),
      );
    }
  }

  Future<void> _onCourseReviewsFetched(
    CourseReviewsFetched event,
    Emitter<CourseDetailsState> emit,
  ) async {
    emit(CourseReviewsFetchInProgress());
    final dataState = await courseReviewsFetchUseCase(
      params: CourseReviewsFetchRequestParams(
        courseId: '62cfe28220ef7d2084494478',
        rate: event.rating,
        page: 1,
      ),
    );
    if (dataState is DataSuccess) {
      final res = dataState.data;
      if (dataState.data?.code == ErrorCode.success)
        emit(CourseReviewsFetchSuccess(res?.data));
      else
        emit(
          CourseReviewsFetchFailure(
            ApiError(errorCode: res?.code, errorMessage: res?.message),
          ),
        );
    }
    if (dataState is DataFailed) {
      emit(
        CourseReviewsFetchFailure(
          ApiError(errorMessage: dataState.error?.message),
        ),
      );
    }
  }
}
