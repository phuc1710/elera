import '../../core/params/inbox_fetch_request_params.dart';
import '../../core/resources/data_state.dart';
import '../../data/models/inbox/inbox_fetch_response_model.dart';

abstract class InboxRepository {
  Future<DataState<InboxFetchResponseModel>> getInboxFetchRequest(
    InboxFetchRequestParams? params,
  );
}
