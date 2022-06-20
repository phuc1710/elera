part of 'signin_bloc.dart';

abstract class SignInEvent {
  const SignInEvent();
}

class SignInSubmitted extends SignInEvent {
  const SignInSubmitted({required this.email, required this.password});

  final String email;
  final String password;
}
