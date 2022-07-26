part of 'password_creation_bloc.dart';

abstract class PasswordCreationEvent {
  const PasswordCreationEvent();
}

class PasswordCreationSubmitted extends PasswordCreationEvent {
  const PasswordCreationSubmitted(this.password);

  final String? password;
}
