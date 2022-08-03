// Project imports:
import 'cache/app_cache.dart';
import 'cache/hive/app_hive_cache.dart';

class LocalStorage {
  factory LocalStorage() {
    return instance;
  }

  LocalStorage._internal() {
    _cache = AppHiveCache();
  }
  static final LocalStorage instance = LocalStorage._internal();
  late AppCache _cache;

  Future<void> initialize() => _cache.initialize();

  AppCache getCache() => _cache;
}
