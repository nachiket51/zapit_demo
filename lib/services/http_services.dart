import 'dart:convert';
import 'package:http/http.dart' as http;
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
    return http.get(uri, headers: await buildHeaders()).then((value) {
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
}
