import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/params/sign_in_request_params.dart';
import '../../../../core/resources/api_error.dart';
import '../../../../core/resources/data_state.dart';
import '../../../../core/utils/constants.dart';
import '../../../../domain/usecases/access_token_save_usecase.dart';
import '../../../../domain/usecases/sign_in_usecase.dart';

part 'signin_event.dart';
part 'signin_state.dart';

@injectable
class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc(
    this.signInUseCase,
    this._accessTokenSaveUC,
  ) : super(SignInInitial()) {
    on<SignInSubmitted>(_onSignInSubmitted);
  }

  final SignInUseCase signInUseCase;
  final AccessTokenSaveUseCase _accessTokenSaveUC;

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
        await _accessTokenSaveUC(params: res?.data?.accessToken);
        emit(SignInSuccess());
      } else
        emit(
          SignInFailed(
            ApiError(errorCode: res?.code, errorMessage: res?.message),
          ),
        );
    }
    if (dataState is DataFailed) {
      emit(SignInFailed(ApiError(errorMessage: dataState.error?.message)));
    }
  }
}
