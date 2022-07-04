import 'dart:async';

import 'package:bloc/bloc.dart';

import '../../../../core/params/sign_up_request_params.dart';
import '../../../../core/resources/data_state.dart';
import '../../../../core/utils/constants.dart';
import '../../../../domain/usecases/sign_up_usecase.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc(this.signUpUseCase) : super(SignUpInitial()) {
    on<SignUpSubmitted>(_onSignUpSubmitted);
  }

  final SignUpUseCase signUpUseCase;

  Future<void> _onSignUpSubmitted(
    SignUpSubmitted event,
    Emitter<SignUpState> emit,
  ) async {
    emit(SignUpLoading());
    final dataState = await signUpUseCase(
      params: SignUpRequestParams(
        email: event.email,
        password: event.password,
      ),
    );
    if (dataState is DataSuccess) {
      if (dataState.data?.status == StatusCode.success)
        emit(SignUpSuccess());
      else
        emit(SignUpFailed(dataState.data?.message));
    }
    if (dataState is DataFailed) {
      emit(SignUpFailed(dataState.data?.message));
    }
  }
}
