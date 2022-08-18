import 'package:injectable/injectable.dart';

import '../../core/params/e_receipt_request_params.dart';
import '../../core/resources/data_state.dart';
import '../../core/usecases/usecases.dart';

import '../../data/models/e_receipt/e_receipt_response.dart';

import '../repositories/e_receipt_repository.dart';

@injectable
class GetEReceiptUseCase
    implements
        UseCase<DataState<EReceiptResponseModel?>, EReceiptRequestParams> {
  GetEReceiptUseCase(this._eReceiptRepository);

  final EReceiptRepository _eReceiptRepository;

  @override
  Future<DataState<EReceiptResponseModel?>> call({
    EReceiptRequestParams? params,
  }) {
    return _eReceiptRepository.getEReceiptRequest(params);
  }
}
