part of 'review_bloc.dart';

@immutable
abstract class ReviewState {}

class ReviewFetchInitial extends ReviewState {}

class ReviewFetchInProgress extends ReviewState {}

class ReviewFetchSuccess extends ReviewState {
  ReviewFetchSuccess(this.reviewData);

  final Data? reviewData;
}

class ReviewFetchFailure extends ReviewState {
  ReviewFetchFailure(this.error);

  final ApiError error;
}
