part of 'signup_bloc.dart';

abstract class SignUpEvent {
  const SignUpEvent();
}

class SignUpSubmitted extends SignUpEvent {
  SignUpSubmitted({required this.email, required this.password});

  final String email;
  final String password;
}
