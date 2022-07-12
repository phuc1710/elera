// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

abstract class HomeState {
  const HomeState();
}

class CourseFetchInitial extends HomeState {
  CourseFetchInitial();
}

class CourseFetchInProgress extends HomeState {
  CourseFetchInProgress();
}

class CourseFetchSuccess extends HomeState {
  CourseFetchSuccess(this.courses);

  final List<CourseModelItem?> courses;
}

class CourseFetchFailure extends HomeState {
  CourseFetchFailure(this.error);

  final ApiError error;
}

class DealFetchInitial extends HomeState {
  DealFetchInitial();
}

class DealFetchInProgress extends HomeState {
  DealFetchInProgress();
}

class DealFetchSuccess extends HomeState {
  DealFetchSuccess(this.deals);

  final List<Deal?> deals;
}

class DealFetchFailure extends HomeState {
  DealFetchFailure(this.error);

  final ApiError error;
}
