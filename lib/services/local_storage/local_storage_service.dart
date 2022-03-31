import 'package:renmoney_test/app/app.logger.dart';

import 'local_storage.dart';

class LocalStorageService implements ILocalStorage {
  static final log = getLogger('LocalStorageService');

  static LocalStorageService? _instance;

  static Future<LocalStorageService> getInstance() async {
    _instance ??= LocalStorageService();

    log.i('Local storage service initialized');
    return _instance!;
  }
}
