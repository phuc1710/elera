part of 'create_new_pin_bloc.dart';

abstract class CreateNewPinState {
  CreateNewPinState();
}

class CreateNewPinInitial extends CreateNewPinState {
  CreateNewPinInitial();
}

class CreateNewPinLoading extends CreateNewPinState {
  CreateNewPinLoading();
}

class CreateNewPinSuccess extends CreateNewPinState {
  CreateNewPinSuccess();
}

class CreateNewPinFailed extends CreateNewPinState {
  CreateNewPinFailed(this.error);

  final ApiError error;
}
