// Dart imports:
import 'dart:async';

// Package imports:
import 'package:ez_cache/ez_cache.dart';

// Project imports:
import '../../key/keys.dart';
import '../app_cache.dart';

class AppHiveCache implements AppCache {
  late HiveCache _hiveCache;

  @override
  Future<void> initialize() {
    _hiveCache = HiveCache();

    return _hiveCache.initialize(
      registerAdapters: () {},
    );
  }

  @override
  Future<String> get accessToken async {
    final token = await _hiveCache.get<String>(Keys.accessToken);

    return token ?? '';
  }

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
}
