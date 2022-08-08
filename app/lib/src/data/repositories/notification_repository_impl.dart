import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../core/params/notification_fetch_request_params.dart';
import '../../core/resources/data_state.dart';
import '../../core/utils/extensions.dart';
import '../../domain/repositories/notification_repository.dart';
import '../datasources/remote/notification_api_service.dart';
import '../models/notification/notification_fetch_response_model.dart';

@Injectable(as: NotificationRepository)
class NotificationRepositoryImpl implements NotificationRepository {
  NotificationRepositoryImpl(this._notificationApiService);

  final NotificationApiService _notificationApiService;

  @override
  Future<DataState<NotificationFetchResponseModel>> getNotificationFetchRequest(
    NotificationFetchRequestParams? params,
  ) async {
    try {
      final httpResponse =
          await _notificationApiService.getNotificationFetchRequest(
        isMockup: true,
        query: params,
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      }

      return DataFailed(httpResponse.dioError);
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }
}
