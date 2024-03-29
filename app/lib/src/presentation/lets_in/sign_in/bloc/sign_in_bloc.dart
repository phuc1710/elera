import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/params/sign_in_request_params.dart';
import '../../../../core/resources/api_error.dart';
import '../../../../core/resources/data_state.dart';
import '../../../../core/utils/constants.dart';
import '../../../../domain/usecases/access_token_save_usecase.dart';
import '../../../../domain/usecases/sign_in_usecase.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

@injectable
class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc(
    this.signInUseCase,
    this._accessTokenSaveUseCase,
  ) : super(SignInInitial()) {
    on<SignInSubmitted>(_onSignInSubmitted);
  }

  final SignInUseCase signInUseCase;
  final AccessTokenSaveUseCase _accessTokenSaveUseCase;

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
      if (dataState.data?.code == ErrorCode.success) {
        await _accessTokenSaveUseCase(params: res?.data?.accessToken);
        emit(SignInSuccess());
      } else
        emit(
          SignInFailure(
            ApiError(errorCode: res?.code, errorMessage: res?.message),
          ),
        );
    }
    if (dataState is DataFailed) {
      emit(SignInFailure(ApiError(errorMessage: dataState.error?.message)));
    }
  }
}
