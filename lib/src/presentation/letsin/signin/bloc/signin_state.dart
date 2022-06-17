part of 'signin_bloc.dart';

enum SignInStatus {
  initial,
  loading,
  signInFailed,
  signInSuccess,
}

class SignInState extends Equatable {
  const SignInState({
    this.status = SignInStatus.initial,
    this.email = '',
    this.password = '',
  });

  final SignInStatus status;
  final String email;
  final String password;

  @override
  List<Object> get props => [email, password];

  SignInState copyWith({
    SignInStatus? status,
    String? email,
    String? password,
  }) {
    return SignInState(
      status: status ?? this.status,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
