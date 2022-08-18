part of 'transactions_bloc.dart';

abstract class TransactionsState extends Equatable {
  const TransactionsState();

  @override
  List<Object?> get props => [];
}

class TransactionsInitial extends TransactionsState {}

class TransactionsInProgress extends TransactionsState {}

class TransactionsFailure extends TransactionsState {
  const TransactionsFailure({this.msg});

  final String? msg;

  @override
  List<Object?> get props => [msg];
}

class TransactionsFetchSuccess extends TransactionsState {
  const TransactionsFetchSuccess({this.transactions});

  final TransactionsDataModel? transactions;

  @override
  List<Object?> get props => [transactions];
}
