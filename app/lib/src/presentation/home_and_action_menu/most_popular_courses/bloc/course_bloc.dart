import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/params/bookmark_addition_request_params.dart';
import '../../../../core/params/bookmark_removal_request_params.dart';
import '../../../../core/params/course_fetch_request_params.dart';
import '../../../../core/resources/api_error.dart';
import '../../../../core/resources/data_state.dart';
import '../../../../core/utils/constants.dart';
import '../../../../data/models/course/course_fetch_response_model.dart';
import '../../../../domain/usecases/get_course_fetch_usecase.dart';
import '../../../../domain/usecases/post_bookmark_addition_usecase.dart';
import '../../../../domain/usecases/post_bookmark_removal_usecase.dart';

part 'course_event.dart';
part 'course_state.dart';

@injectable
class CourseBloc extends Bloc<CourseEvent, CourseState> {
  CourseBloc(
    this.courseFetchUseCase,
    this.bookmarkAdditionUseCase,
    this.bookmarkRemovalUseCase,
  ) : super(CourseFetchInitial()) {
    on<CourseFetched>(_onCourseFetched);
    on<CourseBookmarkAddRequested>(_onBookmarkAdded);
    on<CourseBookmarkRemoveRequested>(_onBookmarkRemoved);
  }

  final CourseFetchUseCase courseFetchUseCase;
  final BookmarkAdditionUseCase bookmarkAdditionUseCase;
  final BookmarkRemovalUseCase bookmarkRemovalUseCase;

  Future<void> _onCourseFetched(
    CourseFetched event,
    Emitter<CourseState> emit,
  ) async {
    emit(CourseFetchInProgress());
    final dataState = await courseFetchUseCase(
      params: CourseFetchRequestParams(),
    );
    if (dataState is DataSuccess) {
      final res = dataState.data;
      if (dataState.data?.code == ErrorCode.success)
        emit(CourseFetchSuccess(res?.data));
      else
        emit(
          CourseFetchFailure(
            ApiError(errorCode: res?.code, errorMessage: res?.message),
          ),
        );
    }
    if (dataState is DataFailed) {
      emit(
        CourseFetchFailure(
          ApiError(errorMessage: dataState.error?.message),
        ),
      );
    }
  }

  Future<void> _onBookmarkAdded(
    CourseBookmarkAddRequested event,
    Emitter<CourseState> emit,
  ) async {
    emit(BookmarkAdditionInProgress());
    final dataState = await bookmarkAdditionUseCase(
      params: BookmarkAdditionRequestParams(),
    );
    if (dataState is DataSuccess) {
      final res = dataState.data;
      if (dataState.data?.code == ErrorCode.success) {
        // event.courseList
        //     .firstWhere((element) => element.categoryName == event.tag)
        //     .items
        //     ?.firstWhere((element) => element.name == event.name)
        //     .isBookmarked = true;
        // event.courseList
        //     .firstWhere((element) => element.categoryName == 'All')
        //     .items
        //     ?.firstWhere((element) => element.name == event.name)
        //     .isBookmarked = true;
        emit(BookmarkAdditionSuccess(event.courseList));
      } else
        emit(
          BookmarkAdditionFailure(
            ApiError(errorCode: res?.code, errorMessage: res?.message),
          ),
        );
    }
    if (dataState is DataFailed) {
      emit(
        BookmarkAdditionFailure(
          ApiError(errorMessage: dataState.error?.message),
        ),
      );
    }
  }

  Future<void> _onBookmarkRemoved(
    CourseBookmarkRemoveRequested event,
    Emitter<CourseState> emit,
  ) async {
    emit(BookmarkRemovalInProgress());
    final dataState = await bookmarkRemovalUseCase(
      params: BookmarkRemovalRequestParams(),
    );
    if (dataState is DataSuccess) {
      final res = dataState.data;
      if (dataState.data?.code == ErrorCode.success) {
        // event.courseList
        //     .firstWhere((element) => element.categoryName == event.tag)
        //     ?.firstWhere((element) => element.name == event.name)
        //     .isBookmarked = false;
        // event.courseList
        //     .firstWhere((element) => element.categoryName == 'All')
        //     ?.firstWhere((element) => element.name == event.name)
        //     .isBookmarked = false;
        emit(BookmarkRemovalSuccess(event.courseList));
      } else
        emit(
          BookmarkRemovalFailure(
            ApiError(errorCode: res?.code, errorMessage: res?.message),
          ),
        );
    }
    if (dataState is DataFailed) {
      emit(
        BookmarkRemovalFailure(
          ApiError(errorMessage: dataState.error?.message),
        ),
      );
    }
  }
}
