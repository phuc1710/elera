import 'dart:async';

import 'package:bloc/bloc.dart';

import '../../../../core/params/sign_in_request_params.dart';
import '../../../../core/resources/api_error.dart';
import '../../../../core/resources/data_state.dart';
import '../../../../core/utils/constants.dart';
import '../../../../domain/usecases/sign_in_usecase.dart';

part 'signin_event.dart';
part 'signin_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc(this.signInUseCase) : super(SignInInitial()) {
    on<SignInSubmitted>(_onSignInSubmitted);
  }

  final SignInUseCase signInUseCase;

  Future<void> _onSignInSubmitted(
    SignInSubmitted event,
    Emitter<SignInState> emit,
  ) async {
    emit(SignInLoading());
    final dataState = await signInUseCase(
      params: SignInRequestParams(
        email: event.email,
        password: event.password,
      ),
    );
    if (dataState is DataSuccess) {
      final res = dataState.data;
      if (dataState.data?.errorCode == ErrorCode.success)
        emit(SignInSuccess());
      else
        emit(
          SignInFailed(
            ApiError(errorCode: res?.errorCode, errorMessage: res?.message),
          ),
        );
    }
    if (dataState is DataFailed) {
      emit(SignInFailed(ApiError(errorMessage: dataState.error?.message)));
    }
  }
}
