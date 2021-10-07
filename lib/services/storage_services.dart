import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:zapit_demo/utils/events_messager/log_message.dart';
import 'package:zapit_demo/utils/keys.dart';

class StorageService {
  static final GetStorage _box = GetStorage();

  /// store cache from API
  static storeResponseCache(http.Response response, int page) {
    var newData = {};
    if (response.body.isNotEmpty) {
      _box.write(PrimaryKeys.STORE_CACHE + '$page', response.body);
    }
  }

  /// fetch cache
  static String fetchResponseCache(int page) {
    if (_box.read(PrimaryKeys.STORE_CACHE+ '$page') != null &&
        _box.read(PrimaryKeys.STORE_CACHE+ '$page').isNotEmpty) {
      try {
        normalLog(message: 'Loading from cache..');
      } catch (e) {
        normalLog(message: e.toString());
      }
      return _box.read(PrimaryKeys.STORE_CACHE+ '$page');
    }
    throw 'Empty Catch';
  }

  /// delete existence cache
  static removeResponseCache() {
    _box.remove(PrimaryKeys.STORE_CACHE);
  }
}
