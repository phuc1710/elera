import 'package:injectable/injectable.dart';

import '../../core/params/notification_fetch_request_params.dart';
import '../../core/resources/data_state.dart';
import '../../core/usecases/usecases.dart';
import '../../data/models/notification/notification_fetch_response_model.dart';
import '../repositories/notification_repository.dart';

@injectable
class NotificationFetchUseCase
    implements
        UseCase<DataState<NotificationFetchResponseModel>,
            NotificationFetchRequestParams> {
  NotificationFetchUseCase(this._notificationRepository);

  final NotificationRepository _notificationRepository;

  @override
  Future<DataState<NotificationFetchResponseModel>> call({
    NotificationFetchRequestParams? params,
  }) {
    return _notificationRepository.getNotificationFetchRequest(params);
  }
}
