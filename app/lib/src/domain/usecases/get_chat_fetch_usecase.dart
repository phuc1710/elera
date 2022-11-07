import 'package:injectable/injectable.dart';

import '../../core/params/chat_fetch_request_params.dart';
import '../../core/resources/data_state.dart';
import '../../core/usecases/usecases.dart';
import '../../data/models/chat/chat_fetch_response_model.dart';
import '../repositories/inbox_repository.dart';

@injectable
class ChatFetchUseCase
    implements
        UseCase<DataState<ChatFetchResponseModel>, ChatFetchRequestParams> {
  ChatFetchUseCase(this._inboxRepository);

  final InboxRepository _inboxRepository;

  @override
  Future<DataState<ChatFetchResponseModel>> call({
    ChatFetchRequestParams? params,
  }) {
    return _inboxRepository.getChatFetchRequest(params);
  }
}
