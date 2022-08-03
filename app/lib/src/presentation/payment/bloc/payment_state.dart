part of 'payment_bloc.dart';

abstract class PaymentState extends Equatable {
  const PaymentState();

  @override
  List<Object?> get props => [];
}

class PaymentInitial extends PaymentState {}

class PaymentInProgress extends PaymentState {}

class PaymentFailure extends PaymentState {
  const PaymentFailure({this.msg});

  final String? msg;

  @override
  List<Object?> get props => [msg];
}

class PaymentFetchSuccess extends PaymentState {
  const PaymentFetchSuccess(this.data);

  final PaymentDataModel? data;

  @override
  List<Object?> get props => [data];
}
