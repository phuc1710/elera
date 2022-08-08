import '../../core/resources/data_state.dart';
import '../../data/models/api_models.dart';
import '../../data/models/edit_profile/edit_profile_response_model.dart';
import '../../data/models/language/language_response_model.dart';

abstract class HelperRepository {
  Future<LanguageModel?> get cacheLanguage;

  Future<bool> saveLanguage(LanguageModel? language);

  Future<DataState<LanguageResponseModel?>> getLanguages();

  Future<DataState<EditProfileResponseModel?>> getCountries();

  Future<DataState<HelperCenterResponseModel?>> getHelperCenter();

  Future<void> clearCache();
}
