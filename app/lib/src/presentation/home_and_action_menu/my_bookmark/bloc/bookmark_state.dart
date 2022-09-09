part of 'bookmark_bloc.dart';

abstract class BookmarkState {
  const BookmarkState();
}

class BookmarkFetchInitial extends BookmarkState {
  BookmarkFetchInitial();
}

class BookmarkFetchInProgress extends BookmarkState {
  BookmarkFetchInProgress();
}

class BookmarkFetchSuccess extends BookmarkState {
  BookmarkFetchSuccess(this.data);

  final bookmark_data.Data? data;
}

class BookmarkFetchFailure extends BookmarkState {
  BookmarkFetchFailure(this.error);

  final ApiError error;
}

class BookmarkRemovalInProgress extends BookmarkState {
  BookmarkRemovalInProgress();
}

class BookmarkRemovalSuccess extends BookmarkState {
  BookmarkRemovalSuccess(this.courses);

  final List<Course> courses;
}

class BookmarkRemovalFailure extends BookmarkState {
  BookmarkRemovalFailure(this.error);

  final ApiError error;
}
