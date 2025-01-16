import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log("");
    log("=========================================");
    log('REQUEST[${options.method}] => Full Path: ${options.uri}');
    if (kDebugMode) {
      print(
          'REQUEST[${options.method}] => Header: ${options.headers.entries.toString()}');
    }

    if (options.data is FormData) {
      FormData formData = options.data as FormData;
      Map<String, dynamic> multipartFieldsMap = {};

      for (var entry in formData.fields) {
        final key = entry.key;
        final value = entry.value;

        if (multipartFieldsMap.containsKey(key)) {
          if (multipartFieldsMap[key] is List) {
            multipartFieldsMap[key].add(value);
          } else {
            List<String> values = [multipartFieldsMap[key], value];
            multipartFieldsMap[key] = values;
          }
        } else {
          multipartFieldsMap[key] = value;
        }
      }

      final multipartFieldsJSON = json.encode(multipartFieldsMap);
      log('REQUEST[MULTIPART FIELDS] => $multipartFieldsJSON');
    } else {
      try {
        log('REQUEST[PAYLOAD] => payload: ${jsonEncode(options.data)}');
      } catch (e) {
        log('REQUEST[PAYLOAD] => body: object is not JSON but multipart!');
      }
    }

    log("=========================================");
    log("");
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log("");
    log("=========================================");
    log('RESPONSE[${response.statusCode}] => Path: ${response.requestOptions.path}');
    log('RESPONSE[${response.statusCode}] => Body: ${json.encode(response.data)}');
    log("=========================================");
    log("");
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    log("");
    log("=========================================");
    log('ERROR[${err.response?.statusCode}] => Full Path: ${err.requestOptions.uri}');
    log('ERROR[${err.response?.statusCode}] => Header: ${err.requestOptions.headers.entries}');
    log('ERROR[${err.response?.statusCode}] => Body: ${err.response}');

    log("=========================================");
    log("");
    return super.onError(err, handler);
  }
}
