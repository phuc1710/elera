part of 'e_receipt_bloc.dart';

abstract class EReceiptEvent extends Equatable {
  const EReceiptEvent();

  @override
  List<Object> get props => [];
}

class EReceiptStarted extends EReceiptEvent {}
