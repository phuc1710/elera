// Project imports:
import 'local/local_storage.dart';

export 'package:retrofit/retrofit.dart';

export 'local/cache/app_cache.dart';
export 'local/key/keys.dart';

// Project imports:

class AppDataSources {
  static Future<void> init() async {
    // Initialize Local Storage
    final LocalStorage localStorage = LocalStorage();
    await localStorage.initialize();
  }
}
