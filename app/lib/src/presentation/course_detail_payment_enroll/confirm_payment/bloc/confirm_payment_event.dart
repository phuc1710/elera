part of 'confirm_payment_bloc.dart';

abstract class ConfirmPaymentEvent {}

class ConfirmPaymentSubmitted extends ConfirmPaymentEvent {
  ConfirmPaymentSubmitted(this.pin);

  final String? pin;
}
