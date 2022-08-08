part of 'bookmark_bloc.dart';

abstract class BookmarkEvent {
  const BookmarkEvent();
}

class BookmarkFetched extends BookmarkEvent {}

class BookmarkRemoveRequested extends BookmarkEvent {
  BookmarkRemoveRequested(this.courseList, this.tag, this.name);

  final List<CourseList> courseList;
  final String tag;
  final String name;
}
