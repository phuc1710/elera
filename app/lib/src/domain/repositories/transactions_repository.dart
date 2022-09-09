import '../../core/params/transactions_request_params.dart';
import '../../core/resources/data_state.dart';
import '../../data/models/transactions/transactions_response_model.dart';

abstract class TransactionsRepository {
  Future<DataState<TransactionsResponseModel>> getTransactionsRequest(
    TransactionsRequestParams? params,
  );
}
