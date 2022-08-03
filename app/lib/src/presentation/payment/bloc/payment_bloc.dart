import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../core/resources/data_state.dart';
import '../../../core/utils/constants.dart';
import '../../../data/models/payment/payment_response_model.dart';
import '../../../domain/usecases/get_payments_usecase.dart';

part 'payment_event.dart';
part 'payment_state.dart';

@injectable
class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  PaymentBloc(this._getPaymentsUC) : super(PaymentInitial()) {
    on<PaymentEvent>((event, emit) {});

    on<PaymentStarted>(_fetchPayments);
  }

  final GetPaymentsUseCase _getPaymentsUC;

  Future<void> _fetchPayments(
    PaymentStarted event,
    Emitter<PaymentState> emit,
  ) async {
    emit(PaymentInProgress());

    final dataState = await _getPaymentsUC();
    if (dataState is DataSuccess) {
      final res = dataState.data;
      if (res?.code == ErrorCode.success) {
        emit(PaymentFetchSuccess(res?.data));
      } else {
        emit(PaymentFailure(msg: res?.message));
      }
    }
    if (dataState is DataFailed) {
      emit(PaymentFailure(msg: dataState.error?.message));
    }
  }
}
