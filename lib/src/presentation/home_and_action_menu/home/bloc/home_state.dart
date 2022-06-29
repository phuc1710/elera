// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

abstract class HomeState {
  const HomeState();
}

class HomeCourseInitial extends HomeState {
  HomeCourseInitial();
}

class HomeCourseLoading extends HomeState {
  HomeCourseLoading();
}

class HomeCourseSuccess extends HomeState {
  HomeCourseSuccess(this.courses);

  final CourseModel? courses;
}

class HomeCourseFailed extends HomeState {
  HomeCourseFailed(this.message);

  final String? message;
}
