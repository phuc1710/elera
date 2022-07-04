part of 'signup_bloc.dart';

abstract class SignUpState {
  SignUpState();
}

class SignUpInitial extends SignUpState {
  SignUpInitial();
}

class SignUpLoading extends SignUpState {
  SignUpLoading();
}

class SignUpSuccess extends SignUpState {
  SignUpSuccess();
}

class SignUpFailed extends SignUpState {
  SignUpFailed(this.error);

  final ApiError error;
}
