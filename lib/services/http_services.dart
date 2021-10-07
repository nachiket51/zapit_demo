import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:zapit_demo/services/storage_services.dart';
import 'package:zapit_demo/utils/events_messager/log_message.dart';
import 'package:zapit_demo/utils/keys.dart';

class HttpServices {
  /// URL BUILDING
  static Uri buildUrl(String command, {Map<String, dynamic>? queryParams}) =>
      Uri(
        host: PrimaryKeys.BASE_URL,
        scheme: 'https',
        path: PrimaryKeys.API_PATH + command,
        queryParameters: queryParams,
      );

  /// HEADER BUILDING
  static Future<Map<String, String>> buildHeaders() async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    return headers;
  }

  /// Http: GET method
  static Future<http.Response> get({
    String command = '/',
    Map<String, dynamic>? params,
  }) async {
    params ??= {};
    params.removeWhere((key, value) => value == null);
    Uri uri = buildUrl(command, queryParams: params);
    return http.get(uri, headers: await buildHeaders()).then((value) async {
      normalLog(
          message: 'Service GET <= $command? body value => ${value.body} \n');
      return value;
    }).catchError((error) {
      throw error;
    });
  }

  /// Http: POST method
  static Future<http.Response> post({
    String command = '/',
    dynamic body,
  }) async {
    body ??= {};
    body.removeWhere((key, value) => value == null);
    Uri uri = buildUrl(command);
    String bodyString = jsonEncode(body);
    return http
        .post(
      uri,
      headers: await buildHeaders(),
      body: bodyString,
    )
        .then((value) {
      normalLog(message: '\n Service POST => $command body => ${value.body}');
      return value;
    }).catchError((error) {
      throw error;
    });
  }

  /// Http: PUT(UPDATE) method
  static Future<http.Response> put({
    String command = '/',
    dynamic body,
  }) async {
    body ??= {};
    body.removeWhere((key, value) => value == null);
    Uri uri = buildUrl(command);
    String bodyString = jsonEncode(body);
    return http
        .put(uri, headers: await buildHeaders(), body: bodyString)
        .then((value) {
      normalLog(message: 'Service PUT <= $command body => ${value.body}');
      return value;
    }).catchError((error) {
      throw error;
    });
  }

  /// Http: DELETE method
  static Future<http.Response> delete({
    String command = '/',
    Map<String, dynamic>? params,
  }) async {
    params ??= {};
    params.removeWhere((key, value) => value == null);
    Uri uri = buildUrl(command, queryParams: params);
    return http.delete(uri, headers: await buildHeaders()).then((value) {
      normalLog(message: 'Service DELETE <= $command body => ${value.body}');
      return value;
    }).catchError((error) {
      throw error;
    });
  }

/*/// Cache: store data offline
  static storeCache(http.Response response) async {
    try {
      var tempDir = await getTemporaryDirectory();
      await deleteExistingCatch(cacheDir: tempDir);
      normalLog(message: 'Storing catch data...');
      File file = File(tempDir.path + "/" + PrimaryKeys.CACHE_DATA_PATH);
      file.writeAsString(response.body, flush: true, mode: FileMode.write);
    } catch (e) {
      normalLog(message: e.toString());
    }
  }

  /// Cache: delete cache Data
  static deleteExistingCatch({var cacheDir}) async {
    if (await File(cacheDir.path + "/" + PrimaryKeys.CACHE_DATA_PATH)
        .exists()) {
      normalLog(message: 'Delete data from cache...');
      cacheDir.delete(recursive: true);
    }
  }*/
}
