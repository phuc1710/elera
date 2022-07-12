import '../../core/params/deal_fetch_request_params.dart';
import '../../core/resources/data_state.dart';
import '../../data/models/deal/deal_fetch_response_model.dart';

abstract class HomeRepository {
  Future<DataState<DealFetchResponseModel>> getDealFetchRequest(
    DealFetchRequestParams? params,
  );
}
