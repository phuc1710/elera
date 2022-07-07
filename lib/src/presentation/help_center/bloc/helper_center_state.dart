part of 'helper_center_bloc.dart';

abstract class HelperCenterState extends Equatable {
  const HelperCenterState();

  @override
  List<Object?> get props => [];
}

class HelperCenterInitial extends HelperCenterState {}

class HelperCenterInProgress extends HelperCenterState {}

class HelperCenterFailure extends HelperCenterState {
  const HelperCenterFailure({this.msg});

  final String? msg;

  @override
  List<Object?> get props => [msg];
}

class HelperCenterFetchSuccess extends HelperCenterState {
  const HelperCenterFetchSuccess(this.data);

  final HelperCenterDataModel? data;

  @override
  List<Object?> get props => [data];
}
