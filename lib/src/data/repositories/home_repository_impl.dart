import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../core/resources/data_state.dart';
import '../../core/params/deal_fetch_request_params.dart';
import '../../core/utils/extensions.dart';
import '../../domain/repositories/home_repository.dart';
import '../datasources/remote/home_api_service.dart';
import '../models/deal/deal_fetch_response_model.dart';

@Injectable(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  HomeRepositoryImpl(this._homeApiService);

  final HomeApiService _homeApiService;

  @override
  Future<DataState<DealFetchResponseModel>> getDealFetchRequest(
    DealFetchRequestParams? params,
  ) async {
    try {
      final httpResponse = await _homeApiService.getDealFetchRequest(
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
