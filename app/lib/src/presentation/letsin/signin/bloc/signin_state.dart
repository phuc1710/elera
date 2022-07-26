part of 'signin_bloc.dart';

abstract class SignInState {
  SignInState();
}

class SignInInitial extends SignInState {
  SignInInitial();
}

class SignInLoading extends SignInState {
  SignInLoading();
}

class SignInSuccess extends SignInState {
  SignInSuccess();
}

class SignInFailed extends SignInState {
  SignInFailed(this.error);

  final ApiError error;
}
