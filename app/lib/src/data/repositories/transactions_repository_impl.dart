import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../core/params/transactions_request_params.dart';
import '../../core/resources/data_state.dart';
import '../../core/utils/extensions.dart';
import '../../domain/repositories/transactions_repository.dart';
import '../datasources/remote/transactions_api_service.dart';
import '../models/transactions/transactions_response_model.dart';

@Injectable(as: TransactionsRepository)
class TransactionsRepositoryImpl implements TransactionsRepository {
  TransactionsRepositoryImpl(this._transactionsApiService);

  final TransactionsApiService _transactionsApiService;

  @override
  Future<DataState<TransactionsResponseModel>> getTransactionsRequest(
    TransactionsRequestParams? params,
  ) async {
    try {
      final httpResponse = await _transactionsApiService.getTransactionsRequest(
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
