import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/params/bookmark_addition_request_params.dart';
import '../../../../core/params/bookmark_removal_request_params.dart';
import '../../../../core/params/recent_search_addition_request_params.dart';
import '../../../../core/params/recent_search_fetch_request_params.dart';
import '../../../../core/params/recent_search_removal_request_params.dart';
import '../../../../core/params/search_fetch_request_params.dart';
import '../../../../core/resources/api_error.dart';
import '../../../../core/resources/data_state.dart';
import '../../../../core/utils/constants.dart';
import '../../../../data/models/course/course_fetch_response_model.dart';
import '../../../../data/models/search/search_fetch_response_model.dart'
    as search;
import '../../../../data/models/search/recent_search_fetch_response_model.dart'
    as recent_search;
import '../../../../domain/usecases/get_recent_search_fetch_usecase.dart';
import '../../../../domain/usecases/get_search_fetch_usecase.dart';
import '../../../../domain/usecases/post_bookmark_addition_usecase.dart';
import '../../../../domain/usecases/post_bookmark_removal_usecase.dart';
import '../../../../domain/usecases/post_recent_search_addition_usecase.dart';
import '../../../../domain/usecases/post_recent_search_removal_usecase.dart';

part 'search_event.dart';
part 'search_state.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc(
    this.searchFetchUseCase,
    this.recentSearchFetchUseCase,
    this.recentSearchAdditionUseCase,
    this.recentSearchRemovalUseCase,
    this.bookmarkAdditionUseCase,
    this.bookmarkRemovalUseCase,
  ) : super(SearchFetchInitial()) {
    on<SearchFetched>(_onSearchFetched);
    on<RecentSearchFetched>(_onRecentSearchFetched);
    on<RecentSearchAdded>(_onRecentSearchAdded);
    on<RecentSearchRemoved>(_onRecentSearchRemoved);
    on<SearchBookmarkAddRequested>(_onBookmarkAdded);
    on<SearchBookmarkRemoveRequested>(_onBookmarkRemoved);
  }

  final SearchFetchUseCase searchFetchUseCase;
  final RecentSearchFetchUseCase recentSearchFetchUseCase;
  final RecentSearchAdditionUseCase recentSearchAdditionUseCase;
  final RecentSearchRemovalUseCase recentSearchRemovalUseCase;
  final BookmarkAdditionUseCase bookmarkAdditionUseCase;
  final BookmarkRemovalUseCase bookmarkRemovalUseCase;

  Future<void> _onSearchFetched(
    SearchFetched event,
    Emitter<SearchState> emit,
  ) async {
    emit(SearchFetchInProgress());
    final dataState = await searchFetchUseCase(
      params: SearchFetchRequestParams(event.term),
    );
    if (dataState is DataSuccess) {
      final res = dataState.data;
      if (dataState.data?.code == ErrorCode.success)
        emit(SearchFetchSuccess(res?.data));
      else
        emit(
          SearchFetchFailure(
            ApiError(errorCode: res?.code, errorMessage: res?.message),
          ),
        );
    }
    if (dataState is DataFailed) {
      emit(
        SearchFetchFailure(
          ApiError(errorMessage: dataState.error?.message),
        ),
      );
    }
  }

  Future<void> _onRecentSearchFetched(
    RecentSearchFetched event,
    Emitter<SearchState> emit,
  ) async {
    emit(RecentSearchFetchInProgress());
    final dataState = await recentSearchFetchUseCase(
      params: RecentSearchFetchRequestParams(event.userEmail),
    );
    if (dataState is DataSuccess) {
      final res = dataState.data;
      if (dataState.data?.code == ErrorCode.success)
        emit(RecentSearchFetchSuccess(res?.data));
      else
        emit(
          RecentSearchFetchFailure(
            ApiError(errorCode: res?.code, errorMessage: res?.message),
          ),
        );
    }
    if (dataState is DataFailed) {
      emit(
        RecentSearchFetchFailure(
          ApiError(errorMessage: dataState.error?.message),
        ),
      );
    }
  }

  Future<void> _onBookmarkAdded(
    SearchBookmarkAddRequested event,
    Emitter<SearchState> emit,
  ) async {
    emit(BookmarkAdditionInProgress());
    final dataState = await bookmarkAdditionUseCase(
      params: BookmarkAdditionRequestParams(),
    );
    if (dataState is DataSuccess) {
      final res = dataState.data;
      if (dataState.data?.code == ErrorCode.success) {
        event.courseList
            .firstWhere((element) => element.name == event.name)
            .isBookmarked = true;
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
    SearchBookmarkRemoveRequested event,
    Emitter<SearchState> emit,
  ) async {
    emit(BookmarkRemovalInProgress());
    final dataState = await bookmarkRemovalUseCase(
      params: BookmarkRemovalRequestParams(),
    );
    if (dataState is DataSuccess) {
      final res = dataState.data;
      if (dataState.data?.code == ErrorCode.success) {
        event.courseList
            .firstWhere((element) => element.name == event.name)
            .isBookmarked = false;
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

  Future<void> _onRecentSearchAdded(
    RecentSearchAdded event,
    Emitter<SearchState> emit,
  ) async {
    emit(BookmarkAdditionInProgress());
    final dataState = await recentSearchAdditionUseCase(
      params: RecentSearchAdditionRequestParams(),
    );
    if (dataState is DataSuccess) {
      final res = dataState.data;
      if (dataState.data?.code == ErrorCode.success) {
        emit(RecentSearchAdditionSuccess());
      } else
        emit(
          RecentSearchAdditionFailure(
            ApiError(errorCode: res?.code, errorMessage: res?.message),
          ),
        );
    }
    if (dataState is DataFailed) {
      emit(
        RecentSearchAdditionFailure(
          ApiError(errorMessage: dataState.error?.message),
        ),
      );
    }
  }

  Future<void> _onRecentSearchRemoved(
    RecentSearchRemoved event,
    Emitter<SearchState> emit,
  ) async {
    emit(RecentSearchAdditionInProgress());
    final dataState = await recentSearchRemovalUseCase(
      params: RecentSearchRemovalRequestParams(),
    );
    if (dataState is DataSuccess) {
      final res = dataState.data;
      if (dataState.data?.code == ErrorCode.success) {
        emit(RecentSearchRemovalSuccess());
      } else
        emit(
          RecentSearchAdditionFailure(
            ApiError(errorCode: res?.code, errorMessage: res?.message),
          ),
        );
    }
    if (dataState is DataFailed) {
      emit(
        RecentSearchAdditionFailure(
          ApiError(errorMessage: dataState.error?.message),
        ),
      );
    }
  }
}
