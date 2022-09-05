part of 'search_bloc.dart';

abstract class SearchState {
  const SearchState();
}

class RecentSearchFetchInProgress extends SearchState {
  RecentSearchFetchInProgress();
}

class RecentSearchFetchSuccess extends SearchState {
  RecentSearchFetchSuccess(this.data);

  final recent_search.Data? data;
}

class RecentSearchFetchFailure extends SearchState {
  RecentSearchFetchFailure(this.error);

  final ApiError error;
}

class RecentSearchAdditionInProgress extends SearchState {
  RecentSearchAdditionInProgress();
}

class RecentSearchAdditionSuccess extends SearchState {
  RecentSearchAdditionSuccess();
}

class RecentSearchAdditionFailure extends SearchState {
  RecentSearchAdditionFailure(this.error);

  final ApiError error;
}

class RecentSearchRemovalInProgress extends SearchState {
  RecentSearchRemovalInProgress();
}

class RecentSearchRemovalSuccess extends SearchState {
  RecentSearchRemovalSuccess();
}

class RecentSearchRemovalFailure extends SearchState {
  RecentSearchRemovalFailure(this.error);

  final ApiError error;
}

class SearchFetchInitial extends SearchState {
  SearchFetchInitial();
}

class SearchFetchInProgress extends SearchState {
  SearchFetchInProgress();
}

class SearchFetchSuccess extends SearchState {
  SearchFetchSuccess(this.data);

  final search.Data? data;
}

class SearchFetchFailure extends SearchState {
  SearchFetchFailure(this.error);

  final ApiError error;
}

class BookmarkAdditionInProgress extends SearchState {
  BookmarkAdditionInProgress();
}

class BookmarkAdditionSuccess extends SearchState {
  BookmarkAdditionSuccess(this.courseList);

  final List<Course> courseList;
}

class BookmarkAdditionFailure extends SearchState {
  BookmarkAdditionFailure(this.error);

  final ApiError error;
}

class BookmarkRemovalInProgress extends SearchState {
  BookmarkRemovalInProgress();
}

class BookmarkRemovalSuccess extends SearchState {
  BookmarkRemovalSuccess(this.courseList);

  final List<Course> courseList;
}

class BookmarkRemovalFailure extends SearchState {
  BookmarkRemovalFailure(this.error);

  final ApiError error;
}
