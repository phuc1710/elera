import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/resources/api_error.dart';
import '../../../../core/resources/data_state.dart';
import '../../../../core/utils/constants.dart';
import '../../../../data/models/pin_validation/pin_validation_response_model.dart';
import '../../../../domain/usecases/post_pin_validation_usecase.dart';

part 'confirm_payment_event.dart';
part 'confirm_payment_state.dart';

@injectable
class ConfirmPaymentBloc
    extends Bloc<ConfirmPaymentEvent, ConfirmPaymentState> {
  ConfirmPaymentBloc(this.pinValidationUseCase)
      : super(ConfirmPaymentInitial()) {
    on<ConfirmPaymentSubmitted>(_onConfirmPaymentSubmitted);
  }

  final PinValidationUseCase pinValidationUseCase;

  Future<void> _onConfirmPaymentSubmitted(
    ConfirmPaymentSubmitted event,
    Emitter<ConfirmPaymentState> emit,
  ) async {
    emit(ConfirmPaymentInProgress());
    final dataState = await pinValidationUseCase();
    if (dataState is DataSuccess) {
      final res = dataState.data;
      if (dataState.data?.code == ErrorCode.success)
        emit(ConfirmPaymentSuccess(res?.data));
      else
        emit(
          ConfirmPaymentFailure(
            ApiError(errorCode: res?.code, errorMessage: res?.message),
          ),
        );
    }
    if (dataState is DataFailed) {
      emit(
        ConfirmPaymentFailure(ApiError(errorMessage: dataState.error?.message)),
      );
    }
  }
}
