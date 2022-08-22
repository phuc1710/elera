import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../core/params/e_receipt_request_params.dart';
import '../../core/resources/data_state.dart';
import '../../core/utils/extensions.dart';
import '../../domain/repositories/e_receipt_repository.dart';
import '../datasources/remote/e_receipt_api_service.dart';
import '../models/e_receipt/e_receipt_response.dart';

@Injectable(as: EReceiptRepository)
class EReceiptRepositoryImpl implements EReceiptRepository {
  EReceiptRepositoryImpl(this._eReceiptApiService);

  final EReceiptApiService _eReceiptApiService;

  @override
  Future<DataState<EReceiptResponseModel>> getEReceiptRequest(
    EReceiptRequestParams? params,
  ) async {
    try {
      final httpResponse = await _eReceiptApiService.getEReceiptRequest(
        isMockup: false,
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
