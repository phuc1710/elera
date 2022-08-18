import '../../core/params/e_receipt_request_params.dart';
import '../../core/resources/data_state.dart';
import '../../data/models/e_receipt/e_receipt_response.dart';

abstract class EReceiptRepository {
  Future<DataState<EReceiptResponseModel>> getEReceiptRequest(
    EReceiptRequestParams? params,
  );
}
