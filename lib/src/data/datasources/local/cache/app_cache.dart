// Dart imports:
import 'dart:async';

abstract class AppCache {
  Future<void> initialize();

  Future<String> get accessToken;

  Future<bool> removeAccessToken();

  Future<bool> saveAccessToken(final String? authToken);

  Future<void> clearCache();
}
