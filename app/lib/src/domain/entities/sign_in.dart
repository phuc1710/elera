import 'package:equatable/equatable.dart';

class SignIn extends Equatable {
  const SignIn(this.email, this.password);

  final String email;
  final String password;

  @override
  List<Object?> get props => [email, password];

  @override
  bool? get stringify => true;
}
