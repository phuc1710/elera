part of 'home_bloc.dart';

abstract class HomeEvent {
  const HomeEvent();
}

class HomeFetched extends HomeEvent {}

class HomeBookmarkAddRequested extends HomeEvent {
  HomeBookmarkAddRequested(this.courseList, this.tag, this.name);

  final List<CourseList> courseList;
  final String tag;
  final String name;
}

class HomeBookmarkRemoveRequested extends HomeEvent {
  HomeBookmarkRemoveRequested(this.courseList, this.tag, this.name);

  final List<CourseList> courseList;
  final String tag;
  final String name;
}
