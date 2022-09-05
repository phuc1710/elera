import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/params/bookmark_addition_request_params.dart';
import '../../../../core/params/bookmark_removal_request_params.dart';
import '../../../../core/params/home_fetch_request_params.dart';
import '../../../../core/resources/api_error.dart';
import '../../../../core/resources/data_state.dart';
import '../../../../core/utils/constants.dart';
import '../../../../data/models/course/course_fetch_response_model.dart';
import '../../../../data/models/home/home_fetch_response_model.dart'
    as home_data;
import '../../../../domain/usecases/get_home_fetch_usecase.dart';
import '../../../../domain/usecases/post_bookmark_addition_usecase.dart';
import '../../../../domain/usecases/post_bookmark_removal_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(
    this.homeFetchUseCase,
    this.bookmarkAdditionUseCase,
    this.bookmarkRemovalUseCase,
  ) : super(HomeFetchInitial()) {
    on<HomeFetched>(_onHomeFetched);
    on<HomeBookmarkAddRequested>(_onBookmarkAdded);
    on<HomeBookmarkRemoveRequested>(_onBookmarkRemoved);
  }

  final HomeFetchUseCase homeFetchUseCase;
  final BookmarkAdditionUseCase bookmarkAdditionUseCase;
  final BookmarkRemovalUseCase bookmarkRemovalUseCase;

  Future<void> _onHomeFetched(
    HomeFetched event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeFetchInProgress());
    final dataState = await homeFetchUseCase(
      params: HomeFetchRequestParams(),
    );
    if (dataState is DataSuccess) {
      final res = dataState.data;
      if (dataState.data?.code == ErrorCode.success)
        emit(HomeFetchSuccess(res?.data));
      else
        emit(
          HomeFetchFailure(
            ApiError(errorCode: res?.code, errorMessage: res?.message),
          ),
        );
    }
    if (dataState is DataFailed) {
      emit(
        HomeFetchFailure(
          ApiError(errorMessage: dataState.error?.message),
        ),
      );
    }
  }

  Future<void> _onBookmarkAdded(
    HomeBookmarkAddRequested event,
    Emitter<HomeState> emit,
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
    HomeBookmarkRemoveRequested event,
    Emitter<HomeState> emit,
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
