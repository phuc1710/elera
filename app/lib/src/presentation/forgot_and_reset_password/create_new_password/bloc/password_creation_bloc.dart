import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/params/password_creation_request_params.dart';
import '../../../../core/resources/api_error.dart';
import '../../../../core/resources/data_state.dart';
import '../../../../core/utils/constants.dart';
import '../../../../domain/usecases/post_password_creation_usecase.dart';

part 'password_creation_event.dart';
part 'password_creation_state.dart';

@injectable
class PasswordCreationBloc
    extends Bloc<PasswordCreationEvent, PasswordCreationState> {
  PasswordCreationBloc(this.passwordCreationUseCase)
      : super(PasswordCreationInitial()) {
    on<PasswordCreationSubmitted>(_onPasswordCreationSubmitted);
  }

  final PasswordCreationUseCase passwordCreationUseCase;

  Future<void> _onPasswordCreationSubmitted(
    PasswordCreationSubmitted event,
    Emitter<PasswordCreationState> emit,
  ) async {
    emit(PasswordCreationInProgress());
    final dataState = await passwordCreationUseCase(
      params: PasswordCreationRequestParams(password: event.password),
    );
    if (dataState is DataSuccess) {
      final res = dataState.data;
      if (dataState.data?.errorCode == ErrorCode.success)
        emit(PasswordCreationSuccess());
      else
        emit(
          PasswordCreationFailure(
            ApiError(errorCode: res?.errorCode, errorMessage: res?.message),
          ),
        );
    }
    if (dataState is DataFailed) {
      emit(
        PasswordCreationFailure(
          ApiError(errorMessage: dataState.error?.message),
        ),
      );
    }
  }
}
