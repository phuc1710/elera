part of 'review_bloc.dart';

@immutable
abstract class ReviewEvent {}

class ReviewFetched extends ReviewEvent {
  ReviewFetched(this.rating);

  final String rating;
}
