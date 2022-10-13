import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../core/params/inbox_fetch_request_params.dart';
import '../../core/resources/data_state.dart';
import '../../core/utils/extensions.dart';
import '../../data/models/inbox/inbox_fetch_response_model.dart';
import '../../domain/repositories/inbox_repository.dart';
import '../datasources/remote/inbox_api_service.dart';

@Injectable(as: InboxRepository)
class InboxRepositoryImpl implements InboxRepository {
  InboxRepositoryImpl(this._inboxApiService);

  final InboxApiService _inboxApiService;

  @override
  Future<DataState<InboxFetchResponseModel>> getInboxFetchRequest(
    InboxFetchRequestParams? params,
  ) async {
    try {
      final httpResponse = await _inboxApiService.getInboxFetchRequest(
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
