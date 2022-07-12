part of 'home_bloc.dart';

abstract class HomeEvent {
  const HomeEvent();
}

class CourseFetched extends HomeEvent {}

class DealFetched extends HomeEvent {}
