import '../../core/params/notification_fetch_request_params.dart';
import '../../core/resources/data_state.dart';
import '../../data/models/notification/notification_fetch_response_model.dart';

abstract class NotificationRepository {
  Future<DataState<NotificationFetchResponseModel>> getNotificationFetchRequest(
    NotificationFetchRequestParams? params,
  );
}
