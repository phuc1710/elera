import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../core/params/bookmark_addition_request_params.dart';
import '../../core/params/bookmark_fetch_request_params.dart';
import '../../core/params/bookmark_removal_request_params.dart';
import '../../core/resources/data_state.dart';
import '../../core/utils/extensions.dart';
import '../../domain/repositories/bookmark_repository.dart';
import '../datasources/remote/bookmark_api_service.dart';
import '../models/bookmark/bookmark_addition_response_model.dart';
import '../models/bookmark/bookmark_fetch_response_model.dart';
import '../models/bookmark/bookmark_removal_response_model.dart';

@Injectable(as: BookmarkRepository)
class BookmarkRepositoryImpl implements BookmarkRepository {
  BookmarkRepositoryImpl(this._bookmarkApiService);

  final BookmarkApiService _bookmarkApiService;

  @override
  Future<DataState<BookmarkFetchResponseModel>> getBookmarkFetchRequest(
    BookmarkFetchRequestParams? params,
  ) async {
    try {
      final httpResponse = await _bookmarkApiService.getBookmarkFetchRequest(
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
  Future<DataState<BookmarkAdditionResponseModel>> postBookmarkAdditionRequest(
    BookmarkAdditionRequestParams? params,
  ) async {
    try {
      final httpResponse =
          await _bookmarkApiService.postBookmarkAdditionRequest(
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
  Future<DataState<BookmarkRemovalResponseModel>> postBookmarkRemovalRequest(
    BookmarkRemovalRequestParams? params,
  ) async {
    try {
      final httpResponse = await _bookmarkApiService.postBookmarkRemovalRequest(
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
