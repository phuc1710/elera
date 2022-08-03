// Dart imports:
import 'dart:async';

// Package imports:
import 'package:ez_cache/ez_cache.dart';

// Project imports:
import '../../../../models/language/language_response_model.dart';
import '../../key/keys.dart';
import '../app_cache.dart';

class AppHiveCache implements AppCache {
  late HiveCache _hiveCache;

  @override
  Future<void> initialize() {
    _hiveCache = HiveCache();

    return _hiveCache.initialize(
      registerAdapters: () {
        Hive.registerAdapter(LanguageModelAdapter());
      },
    );
  }

  @override
  Future<String> get accessToken async {
    final token = await _hiveCache.get<String>(Keys.accessToken);

    return token ?? '';
  }

  @override
  Future<LanguageModel?> get language =>
      _hiveCache.get<LanguageModel>(Keys.language);

  @override
  Future<bool> removeAccessToken() {
    return _hiveCache.remove(Keys.accessToken);
  }

  @override
  Future<bool> saveAccessToken(final String? authToken) {
    return _hiveCache.put(Keys.accessToken, authToken);
  }

  @override
  Future<void> clearCache() {
    return _hiveCache.clear();
  }

  @override
  Future<bool> saveLanguage(LanguageModel? languageModel) =>
      _hiveCache.put(Keys.language, languageModel);

  @override
  Future<bool> removeLanguage() => _hiveCache.remove(Keys.language);
}
