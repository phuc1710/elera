part of 'helper_center_bloc.dart';

abstract class HelperCenterEvent extends Equatable {
  const HelperCenterEvent();

  @override
  List<Object> get props => [];
}

class HelperCenterStarted extends HelperCenterEvent {}
