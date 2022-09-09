part of 'confirm_payment_bloc.dart';

abstract class ConfirmPaymentState {}

class ConfirmPaymentInitial extends ConfirmPaymentState {}

class ConfirmPaymentInProgress extends ConfirmPaymentState {}

class ConfirmPaymentSuccess extends ConfirmPaymentState {
  ConfirmPaymentSuccess(this.data);

  final Data? data;
}

class ConfirmPaymentFailure extends ConfirmPaymentState {
  ConfirmPaymentFailure(this.error);

  final ApiError error;
}
