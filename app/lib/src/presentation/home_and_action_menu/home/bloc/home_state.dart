part of 'home_bloc.dart';

abstract class HomeState {
  const HomeState();
}

class HomeFetchInitial extends HomeState {
  HomeFetchInitial();
}

class HomeFetchInProgress extends HomeState {
  HomeFetchInProgress();
}

class HomeFetchSuccess extends HomeState {
  HomeFetchSuccess(this.data);

  final home_data.Data? data;
}

class HomeFetchFailure extends HomeState {
  HomeFetchFailure(this.error);

  final ApiError error;
}

class BookmarkAdditionInProgress extends HomeState {
  BookmarkAdditionInProgress();
}

class BookmarkAdditionSuccess extends HomeState {
  BookmarkAdditionSuccess(this.courseList);

  final List<Course> courseList;
}

class BookmarkAdditionFailure extends HomeState {
  BookmarkAdditionFailure(this.error);

  final ApiError error;
}

class BookmarkRemovalInProgress extends HomeState {
  BookmarkRemovalInProgress();
}

class BookmarkRemovalSuccess extends HomeState {
  BookmarkRemovalSuccess(this.courseList);

  final List<Course> courseList;
}

class BookmarkRemovalFailure extends HomeState {
  BookmarkRemovalFailure(this.error);

  final ApiError error;
}
