import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../core/params/home_fetch_request_params.dart';
import '../../core/resources/data_state.dart';
import '../../core/utils/extensions.dart';
import '../../domain/repositories/home_repository.dart';
import '../datasources/remote/home_api_service.dart';
import '../models/home/home_fetch_response_model.dart';

@Injectable(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  HomeRepositoryImpl(this._homeApiService);

  final HomeApiService _homeApiService;

  @override
  Future<DataState<HomeFetchResponseModel>> getHomeFetchRequest(
    HomeFetchRequestParams? params,
  ) async {
    try {
      final httpResponse = await _homeApiService.getHomeFetchRequest(
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
