import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../core/params/recent_search_addition_request_params.dart';
import '../../core/params/recent_search_fetch_request_params.dart';
import '../../core/params/recent_search_removal_request_params.dart';
import '../../core/params/search_fetch_request_params.dart';
import '../../core/resources/data_state.dart';
import '../../core/utils/extensions.dart';
import '../../domain/repositories/search_repository.dart';
import '../datasources/remote/search_api_service.dart';
import '../models/search/recent_search_addition_response_model.dart';
import '../models/search/recent_search_fetch_response_model.dart';
import '../models/search/recent_search_removal_response_model.dart';
import '../models/search/search_fetch_response_model.dart';

@Injectable(as: SearchRepository)
class SearchRepositoryImpl implements SearchRepository {
  SearchRepositoryImpl(this._searchApiService);

  final SearchApiService _searchApiService;

  @override
  Future<DataState<RecentSearchFetchResponseModel>> getRecentSearchFetchRequest(
    RecentSearchFetchRequestParams? params,
  ) async {
    try {
      final httpResponse = await _searchApiService.getRecentSearchFetchRequest(
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

  @override
  Future<DataState<RecentSearchAdditionResponseModel>>
      postRecentSearchAdditionRequest(
    RecentSearchAdditionRequestParams? params,
  ) async {
    try {
      final httpResponse =
          await _searchApiService.postRecentSearchAdditionRequest(
        isMockup: true,
        body: params,
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      }

      return DataFailed(httpResponse.dioError);
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<RecentSearchRemovalResponseModel>>
      postRecentSearchRemovalRequest(
    RecentSearchRemovalRequestParams? params,
  ) async {
    try {
      final httpResponse =
          await _searchApiService.postRecentSearchRemovalRequest(
        isMockup: true,
        body: params,
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      }

      return DataFailed(httpResponse.dioError);
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<SearchFetchResponseModel>> getSearchFetchRequest(
    SearchFetchRequestParams? params,
  ) async {
    try {
      final httpResponse = await _searchApiService.getSearchFetchRequest(
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
