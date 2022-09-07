import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/params/course_reviews_fetch_request_params.dart';
import '../../../../core/resources/api_error.dart';
import '../../../../core/resources/data_state.dart';
import '../../../../core/utils/constants.dart';
import '../../../../data/models/course_reviews/course_reviews_fetch_response_model.dart';
import '../../../../domain/usecases/get_course_reviews_fetch_usecase.dart';

part 'review_event.dart';
part 'review_state.dart';

@injectable
class ReviewBloc extends Bloc<ReviewEvent, ReviewState> {
  ReviewBloc(
    this.reviewFetchUseCase,
  ) : super(ReviewFetchInitial()) {
    on<ReviewFetched>(_onReviewFetched);
  }

  final CourseReviewsFetchUseCase reviewFetchUseCase;

  Future<void> _onReviewFetched(
    ReviewFetched event,
    Emitter<ReviewState> emit,
  ) async {
    emit(ReviewFetchInProgress());
    final dataState = await reviewFetchUseCase(
      params: CourseReviewsFetchRequestParams(
        courseId: '62cfe28220ef7d2084494478',
        rate: event.rating,
        page: 1,
      ),
    );
    if (dataState is DataSuccess) {
      final res = dataState.data;
      if (dataState.data?.code == ErrorCode.success)
        emit(ReviewFetchSuccess(res?.data));
      else
        emit(
          ReviewFetchFailure(
            ApiError(errorCode: res?.code, errorMessage: res?.message),
          ),
        );
    }
    if (dataState is DataFailed) {
      emit(
        ReviewFetchFailure(
          ApiError(errorMessage: dataState.error?.message),
        ),
      );
    }
  }
}
