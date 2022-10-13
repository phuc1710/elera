import 'package:injectable/injectable.dart';

import '../../core/params/inbox_fetch_request_params.dart';
import '../../core/resources/data_state.dart';
import '../../core/usecases/usecases.dart';
import '../../data/models/inbox/inbox_fetch_response_model.dart';
import '../repositories/inbox_repository.dart';

@injectable
class InboxFetchUseCase
    implements
        UseCase<DataState<InboxFetchResponseModel>, InboxFetchRequestParams> {
  InboxFetchUseCase(this._inboxRepository);

  final InboxRepository _inboxRepository;

  @override
  Future<DataState<InboxFetchResponseModel>> call({
    InboxFetchRequestParams? params,
  }) {
    return _inboxRepository.getInboxFetchRequest(params);
  }
}
