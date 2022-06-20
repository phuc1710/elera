import 'dart:async';

import 'package:bloc/bloc.dart';

import '../../../../core/network/api.dart';
import '../../../../core/network/status_code.dart';

part 'signin_event.dart';
part 'signin_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitial()) {
    on<SignInSubmitted>(_onSignInSubmitted);
  }

  Future<void> _onSignInSubmitted(
    SignInSubmitted event,
    Emitter<SignInState> emit,
  ) async {
    emit(SignInLoading());
    try {
      final res = await Api.login(email: event.email, password: event.password);
      if (res?.status == StatusCode.success) {
        emit(SignInSuccess());
      } else {
        emit(SignInFailed(res?.message));
      }
    } catch (e) {
      emit(SignInFailed(null));
    }
  }
}
