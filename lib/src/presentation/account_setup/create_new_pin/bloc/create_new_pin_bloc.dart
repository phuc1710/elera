import 'package:bloc/bloc.dart';

import '../../../../core/params/create_new_pin_request_params.dart';
import '../../../../core/resources/api_error.dart';
import '../../../../core/resources/data_state.dart';
import '../../../../core/utils/constants.dart';
import '../../../../domain/usecases/create_new_pin_usecase.dart';

part 'create_new_pin_event.dart';
part 'create_new_pin_state.dart';

class CreateNewPinBloc extends Bloc<CreateNewPinEvent, CreateNewPinState> {
  CreateNewPinBloc(this.createNewPinUseCase) : super(CreateNewPinInitial()) {
    on<CreateNewPinSubmitted>(_onCreateNewPinSubmitted);
  }

  final CreateNewPinUseCase createNewPinUseCase;

  Future<void> _onCreateNewPinSubmitted(
    CreateNewPinSubmitted event,
    Emitter<CreateNewPinState> emit,
  ) async {
    emit(CreateNewPinLoading());
    final dataState = await createNewPinUseCase(
      params: CreateNewPinRequestParams(
        pinCode: event.pinCode,
      ),
    );
    if (dataState is DataSuccess) {
      final res = dataState.data;
      if (dataState.data?.errorCode == ErrorCode.success)
        emit(CreateNewPinSuccess());
      else
        emit(
          CreateNewPinFailed(
            ApiError(errorCode: res?.errorCode, errorMessage: res?.message),
          ),
        );
    }
    if (dataState is DataFailed) {
      emit(
        CreateNewPinFailed(
          ApiError(errorMessage: dataState.error?.message),
        ),
      );
    }
  }
}
