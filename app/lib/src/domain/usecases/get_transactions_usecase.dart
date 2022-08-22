import 'package:injectable/injectable.dart';

import '../../core/params/transactions_request_params.dart';
import '../../core/resources/data_state.dart';
import '../../core/usecases/usecases.dart';

import '../../data/models/transactions/transactions_response_model.dart';
import '../repositories/transactions_repository.dart';

@injectable
class GetTransactionsUseCase
    implements
        UseCase<DataState<TransactionsResponseModel?>,
            TransactionsRequestParams> {
  GetTransactionsUseCase(this._transactionsRepository);

  final TransactionsRepository _transactionsRepository;

  @override
  Future<DataState<TransactionsResponseModel?>> call({
    TransactionsRequestParams? params,
  }) {
    return _transactionsRepository.getTransactionsRequest(params);
  }
}
