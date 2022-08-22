part of 'e_receipt_bloc.dart';

// @immutable
// abstract class EReceiptState {}

// class EReceiptInitial extends EReceiptState {}

abstract class EReceiptState extends Equatable {
  const EReceiptState();

  @override
  List<Object?> get props => [];
}

class EReceiptInitial extends EReceiptState {}

class EReceiptInProgress extends EReceiptState {}

class EReceiptFailure extends EReceiptState {
  const EReceiptFailure({this.msg});

  final String? msg;

  @override
  List<Object?> get props => [msg];
}

class EReceiptFetchSuccess extends EReceiptState {
  const EReceiptFetchSuccess({this.eReceipt});

  final EReceiptModel? eReceipt;

  @override
  List<Object?> get props => [eReceipt];
}
