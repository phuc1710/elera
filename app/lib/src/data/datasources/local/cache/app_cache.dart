// Dart imports:
import 'dart:async';

import '../../../models/language/language_response_model.dart';

abstract class AppCache {
  Future<void> initialize();

  Future<String> get accessToken;

  Future<LanguageModel?> get language;

  Future<bool> removeAccessToken();

  Future<bool> saveAccessToken(final String? authToken);

  Future<bool> removeLanguage();

  Future<bool> saveLanguage(final LanguageModel? languageModel);

  Future<void> clearCache();
}
