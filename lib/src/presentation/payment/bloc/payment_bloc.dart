import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../core/network/api.dart';
import '../../../core/utils/constants.dart';
import '../../../data/models/payment/payment_response_model.dart';

part 'payment_event.dart';
part 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  PaymentBloc() : super(PaymentInitial()) {
    on<PaymentEvent>((event, emit) {});

    on<PaymentStarted>(_fetchPayments);
  }

  Future<void> _fetchPayments(
    PaymentStarted event,
    Emitter<PaymentState> emit,
  ) async {
    emit(PaymentInProgress());
    try {
      final res = await Api.getPayments();
      if (res?.status == StatusCode.success) {
        emit(PaymentFetchSuccess(res?.data));
      } else {
        emit(PaymentFailure(msg: res?.message));
      }
    } catch (_) {
      emit(const PaymentFailure());
    }
  }
}
