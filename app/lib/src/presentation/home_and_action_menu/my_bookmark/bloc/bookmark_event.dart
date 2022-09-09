part of 'bookmark_bloc.dart';

abstract class BookmarkEvent {
  const BookmarkEvent();
}

class BookmarkFetched extends BookmarkEvent {}

class BookmarkRemoveRequested extends BookmarkEvent {
  BookmarkRemoveRequested(this.courses, this.tag, this.name);

  final List<Course> courses;
  final String tag;
  final String name;
}
