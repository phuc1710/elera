part of 'sign_in_bloc.dart';

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

class SignInFailure extends SignInState {
  SignInFailure(this.error);

  final ApiError error;
}
