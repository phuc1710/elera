import 'dart:io';

import 'package:injectable/injectable.dart';

import '../../core/nd_network/nd_network.dart';
import '../../core/resources/data_state.dart';
import '../../domain/repositories/helper_repository.dart';
import '../datasources/local/cache/app_cache.dart';
import '../datasources/remote/helper_api_service.dart';
import '../models/edit_profile/edit_profile_response_model.dart';
import '../models/helper_center/helper_center_response_model.dart';
import '../models/language/language_response_model.dart';

@LazySingleton(as: HelperRepository)
class HelperRepositoryImpl implements HelperRepository {
  HelperRepositoryImpl(this._cache, this._helperApiService);

  final AppCache _cache;
  final HelperApiService _helperApiService;

  @override
  Future<DataState<EditProfileResponseModel?>> getCountries() async {
    try {
      final httpResponse = await _helperApiService.getCountries();

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      }

      return DataFailed(
        DioError(
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
          requestOptions: httpResponse.response.requestOptions,
          type: DioErrorType.response,
        ),
      );
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<LanguageResponseModel?>> getLanguages() async {
    try {
      final httpResponse = await _helperApiService.getLanguages();

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      }

      return DataFailed(
        DioError(
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
          requestOptions: httpResponse.response.requestOptions,
          type: DioErrorType.response,
        ),
      );
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<HelperCenterResponseModel?>> getHelperCenter() async {
    try {
      final httpResponse = await _helperApiService.getHelperCenter();

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      }

      return DataFailed(
        DioError(
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
          requestOptions: httpResponse.response.requestOptions,
          type: DioErrorType.response,
        ),
      );
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<LanguageModel?> get cacheLanguage => _cache.language;

  @override
  Future<bool> saveLanguage(LanguageModel? language) =>
      _cache.saveLanguage(language);

  @override
  Future<void> clearCache() => _cache.clearCache();
}
