import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/params/bookmark_fetch_request_params.dart';
import '../../../../core/params/bookmark_removal_request_params.dart';
import '../../../../core/resources/api_error.dart';
import '../../../../core/resources/data_state.dart';
import '../../../../core/utils/constants.dart';
import '../../../../data/models/bookmark/bookmark_fetch_response_model.dart'
    as bookmark_data;
import '../../../../data/models/course/course_fetch_response_model.dart';
import '../../../../domain/usecases/get_bookmark_fetch_usecase.dart';
import '../../../../domain/usecases/post_bookmark_removal_usecase.dart';

part 'bookmark_event.dart';
part 'bookmark_state.dart';

@injectable
class BookmarkBloc extends Bloc<BookmarkEvent, BookmarkState> {
  BookmarkBloc(
    this.bookmarkFetchUseCase,
    this.bookmarkRemovalUseCase,
  ) : super(BookmarkFetchInitial()) {
    on<BookmarkFetched>(_onBookmarkFetched);
    on<BookmarkRemoveRequested>(_onBookmarkRemoved);
  }

  final BookmarkFetchUseCase bookmarkFetchUseCase;
  final BookmarkRemovalUseCase bookmarkRemovalUseCase;

  Future<void> _onBookmarkFetched(
    BookmarkFetched event,
    Emitter<BookmarkState> emit,
  ) async {
    emit(BookmarkFetchInProgress());
    final dataState = await bookmarkFetchUseCase(
      params: BookmarkFetchRequestParams(),
    );
    if (dataState is DataSuccess) {
      final res = dataState.data;
      if (dataState.data?.code == ErrorCode.success) {
        emit(BookmarkFetchSuccess(res?.data));
      } else
        emit(
          BookmarkFetchFailure(
            ApiError(errorCode: res?.code, errorMessage: res?.message),
          ),
        );
    }
    if (dataState is DataFailed) {
      emit(
        BookmarkFetchFailure(
          ApiError(errorMessage: dataState.error?.message),
        ),
      );
    }
  }

  Future<void> _onBookmarkRemoved(
    BookmarkRemoveRequested event,
    Emitter<BookmarkState> emit,
  ) async {
    emit(BookmarkRemovalInProgress());
    final dataState = await bookmarkRemovalUseCase(
      params: BookmarkRemovalRequestParams(),
    );
    if (dataState is DataSuccess) {
      final res = dataState.data;
      if (dataState.data?.code == ErrorCode.success) {
        event.courseList
            .firstWhere((element) => element.tag == event.tag)
            .items
            ?.removeWhere((element) => element.name == event.name);
        event.courseList
            .firstWhere((element) => element.tag == 'All')
            .items
            ?.removeWhere((element) => element.name == event.name);
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
