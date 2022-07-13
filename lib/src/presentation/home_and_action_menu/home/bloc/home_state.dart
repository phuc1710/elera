// ignore_for_file: public_member_api_docs, sort_constructors_first
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

  final Data? data;
}

class HomeFetchFailure extends HomeState {
  HomeFetchFailure(this.error);

  final ApiError error;
}
