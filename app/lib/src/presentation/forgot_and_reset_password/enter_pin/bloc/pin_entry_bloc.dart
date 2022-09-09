import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/params/pin_sending_request_params.dart';
import '../../../../core/params/pin_validation_request_params.dart';
import '../../../../core/resources/api_error.dart';
import '../../../../core/resources/data_state.dart';
import '../../../../core/utils/constants.dart';
import '../../../../domain/usecases/get_pin_sending_usecase.dart';
import '../../../../domain/usecases/post_pin_validation_usecase.dart';

part 'pin_entry_event.dart';
part 'pin_entry_state.dart';

@Injectable()
class PinEntryBloc extends Bloc<PinEntryEvent, PinEntryState> {
  PinEntryBloc(this.pinSendingUseCase, this.pinEntryUseCase)
      : super(PinEntryInitial()) {
    on<PinSendingRequested>(_onPinSendingSubmitted);
    on<PinEntrySubmitted>(_onPinEntrySubmitted);
  }

  final PinSendingUseCase pinSendingUseCase;
  final PinValidationUseCase pinEntryUseCase;

  Future<void> _onPinSendingSubmitted(
    PinSendingRequested event,
    Emitter<PinEntryState> emit,
  ) async {
    emit(PinSendingInProgress());
    final dataState = await pinSendingUseCase(
      params: PinSendingRequestParams(contactInfo: event.contactInfo),
    );
    if (dataState is DataSuccess) {
      final res = dataState.data;
      if (dataState.data?.errorCode == ErrorCode.success)
        emit(PinSendingSuccess());
      else
        emit(
          PinSendingFailure(
            ApiError(errorCode: res?.errorCode, errorMessage: res?.message),
          ),
        );
    }
    if (dataState is DataFailed) {
      emit(
        PinSendingFailure(
          ApiError(errorMessage: dataState.error?.message),
        ),
      );
    }
  }

  Future<void> _onPinEntrySubmitted(
    PinEntrySubmitted event,
    Emitter<PinEntryState> emit,
  ) async {
    emit(PinEntryInProgress());
    final dataState = await pinEntryUseCase(
      params: PinValidationRequestParams(pin: event.pin),
    );
    if (dataState is DataSuccess) {
      final res = dataState.data;
      if (dataState.data?.code == ErrorCode.success)
        emit(PinEntrySuccess());
      else
        emit(
          PinEntryFailure(
            ApiError(errorCode: res?.code, errorMessage: res?.message),
          ),
        );
    }
    if (dataState is DataFailed) {
      emit(
        PinEntryFailure(
          ApiError(errorMessage: dataState.error?.message),
        ),
      );
    }
  }
}
