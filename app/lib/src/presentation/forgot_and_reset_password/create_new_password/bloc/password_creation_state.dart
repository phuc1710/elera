part of 'password_creation_bloc.dart';

abstract class PasswordCreationState {
  PasswordCreationState();
}

class PasswordCreationInitial extends PasswordCreationState {
  PasswordCreationInitial();
}

class PasswordCreationInProgress extends PasswordCreationState {
  PasswordCreationInProgress();
}

class PasswordCreationSuccess extends PasswordCreationState {
  PasswordCreationSuccess();
}

class PasswordCreationFailure extends PasswordCreationState {
  PasswordCreationFailure(this.error);

  final ApiError error;
}
