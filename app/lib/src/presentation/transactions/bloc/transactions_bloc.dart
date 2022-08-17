import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../core/resources/data_state.dart';
import '../../../core/utils/constants.dart';
import '../../../data/models/transactions/transactions_response_model.dart';
import '../../../domain/usecases/get_transactions_usecase.dart';

part 'transactions_event.dart';
part 'transactions_state.dart';


@injectable
class TransactionsBloc extends Bloc<TransactionsEvent, TransactionsState> {
  TransactionsBloc(
    this._getTransactionsUC,
  ) : super(TransactionsInitial()) {
    on<TransactionsEvent>((event, emit) {});

    on<TransactionsStarted>(_fetchTransactions);
  }

  final GetTransactionsUseCase _getTransactionsUC;

  Future<void> _fetchTransactions(
    TransactionsStarted event,
    Emitter<TransactionsState> emit,
  ) async {
    emit(TransactionsInProgress());

    final dataState = await _getTransactionsUC();
    if (dataState is DataSuccess) {
      final res = dataState.data;
      if (res?.code == ErrorCode.success) {
        emit(
          TransactionsFetchSuccess(
            transactions: res?.data,
          ),
        );
      } else {
        emit(TransactionsFailure(msg: res?.message));
      }
    }
    if (dataState is DataFailed) {
      emit(TransactionsFailure(msg: dataState.error?.message));
    }
  }
}
