part of 'search_bloc.dart';

abstract class SearchEvent {
  const SearchEvent();
}

class RecentSearchFetched extends SearchEvent {
  RecentSearchFetched(this.userEmail);

  final String userEmail;
}

class RecentSearchAdded extends SearchEvent {
  RecentSearchAdded(this.term);

  final String term;
}

class RecentSearchRemoved extends SearchEvent {
  RecentSearchRemoved(this.term);

  final String term;
}

class SearchFetched extends SearchEvent {
  SearchFetched(this.term);

  final String term;
}

class SearchBookmarkAddRequested extends SearchEvent {
  SearchBookmarkAddRequested(this.courseList, this.tag, this.name);

  final List<Item> courseList;
  final String tag;
  final String name;
}

class SearchBookmarkRemoveRequested extends SearchEvent {
  SearchBookmarkRemoveRequested(this.courseList, this.tag, this.name);

  final List<Item> courseList;
  final String tag;
  final String name;
}
