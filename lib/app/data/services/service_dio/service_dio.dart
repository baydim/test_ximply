// ignore_for_file: non_constant_identifier_names, unnecessary_null_comparison

import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';

import 'package:mime_type/mime_type.dart';
import 'api_interceptor.dart';
import 'dio_error_handler.dart';
import 'response_default.dart';
import 'url_api.dart';

class ServiceDio {
  static final _defaultInterceptor = ApiInterceptor();

  static Future<BaseOptions> _options() async {
    // var token = await ServiceShared.getToken();
    return BaseOptions(
      baseUrl: UrlApi.baseUrl ?? '',
      headers: {
        // 'Authorization': 'Bearer ${token?.data?.token}',
      },
      contentType: 'application/json',
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
    );
  }

  static Future<ResponseDefault> postCase({
    required String url,
    required dynamic body,
  }) async {
    late ResponseDefault result;
    try {
      final dio = Dio(await _options());
      dio.interceptors.add(_defaultInterceptor);
      final response = await dio.post(url, data: body);

      result = ResponseDefault.fromJson(
        jsonDecode(response.data),
      );
    } on DioException catch (e) {
      result = funcDioExceptionHandler(e);
    }
    return result;
  }

  static Future<ResponseDefault> getCase({
    required String url,
    Map<String, dynamic>? queries,
    dynamic body,
  }) async {
    late ResponseDefault result;

    try {
      final dio = Dio(await _options());
      dio.interceptors.add(_defaultInterceptor);
      final response = await dio.get(url, queryParameters: queries, data: body);
      result = ResponseDefault.fromJson(
        jsonDecode(response.data),
      );
    } on DioException catch (e) {
      result = funcDioExceptionHandler(e);
    }
    return result;
  }

  static Future<ResponseDefault> uploadCase({
    required String url,
    required File image,
  }) async {
    log("path setup to api: ${image.path}");
    final fileName = image.path.split('/').last;
    String? mimeType = mime(fileName);
    String? mimeImg = mimeType?.split('/')[0];
    String? typeImg = mimeType?.split('/')[1];

    late ResponseDefault result;
    try {
      final uploadOption = await _options();
      uploadOption.contentType = "multipart/form-data";
      final dio = Dio(uploadOption);
      dio.interceptors.add(_defaultInterceptor);

      final formData = FormData.fromMap({
        'file': MultipartFile.fromFileSync(
          image.path,
          filename: fileName,
          contentType: MediaType('$mimeImg', '$typeImg'),
        ),
      });

      final response = await dio.post(url, data: formData);
      result = ResponseDefault.fromJson(
        jsonDecode(response.data),
      );
    } on DioException catch (e) {
      result = funcDioExceptionHandler(e);
    }
    return result;
  }

  static Future<ResponseDefault> putCase({
    required String url,
    dynamic body,
  }) async {
    late ResponseDefault result;
    try {
      final dio = Dio(await _options());
      dio.interceptors.add(_defaultInterceptor);
      final response = await dio.put(url, data: body);
      result = ResponseDefault.fromJson(
        jsonDecode(response.data),
      );
    } on DioException catch (e) {
      result = funcDioExceptionHandler(e);
    }

    return result;
  }

  /// PATCH CASE
  static Future<ResponseDefault> patchCase({
    required String url,
    dynamic body,
  }) async {
    late ResponseDefault result;
    try {
      final dio = Dio(await _options());
      dio.interceptors.add(_defaultInterceptor);
      final response = await dio.patch(url, data: body);
      result = ResponseDefault.fromJson(
        jsonDecode(response.data),
      );
    } on DioException catch (e) {
      result = funcDioExceptionHandler(e);
    }

    return result;
  }

  static Future<ResponseDefault> deleteCase({
    required String url,
  }) async {
    late ResponseDefault result;
    try {
      final dio = Dio(await _options());
      dio.interceptors.add(_defaultInterceptor);
      final response = await dio.delete(url);
      result = ResponseDefault.fromJson(
        jsonDecode(response.data),
      );
    } on DioException catch (e) {
      result = funcDioExceptionHandler(e);
    }

    return result;
  }

  static Future<ResponseDefault> flexibleMultipartCase(
      {required String url,
      required Map<String, dynamic> body,
      List<FileCase>? listFile,
      required String method}) async {
    late ResponseDefault result;
    try {
      final uploadOption = await _options();
      uploadOption.contentType = "multipart/form-data";
      final dio = Dio(uploadOption);
      dio.interceptors.add(_defaultInterceptor);
      final formData = FormData.fromMap(
        body,
      );

      if (listFile != null || listFile!.isNotEmpty) {
        for (var i in listFile) {
          final fileName = i.file.path.split('/').last;
          String? mimeType = mime(fileName);
          String? mimeImg = mimeType?.split('/')[0];
          String? typeImg = mimeType?.split('/')[1];

          formData.files.add(
            MapEntry(
              i.keyName,
              MultipartFile.fromFileSync(
                i.file.path,
                filename: fileName,
                contentType: MediaType('$mimeImg', '$typeImg'),
              ),
            ),
          );
        }
      }
      for (var i in formData.fields.toList()) {
        log("${i.key} | ${i.value}", name: "fields");
      }

      for (var i in formData.files.toList()) {
        log("${i.key} | ${i.value.filename!}", name: "files");
      }

      final response = await dio.request(
        url,
        data: formData,
        options: Options(
          method: method,
        ),
      );
      result = ResponseDefault.fromJson(
        jsonDecode(response.data),
      );
    } on DioException catch (e) {
      result = funcDioExceptionHandler(e);
    }
    return result;
  }

  static Future sendNotif(
      {required String header, required String content}) async {
    final dio = Dio(
      BaseOptions(
        baseUrl: "https://onesignal.com/api/v1/",
        headers: {
          'Authorization':
              'Basic MWNiZjUzMmItMDZmZC00NGY3LWExNzItNmI0M2E1YTFmNjQw',
        },
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
      ),
    );

    await dio.post("notifications", data: {
      "app_id": "36a0dd6e-b4fb-4c0c-90fa-4c0b4c6844e9",
      "included_segments": ["Total Subscriptions"],
      "headings": {
        "en": header,
      },
      "contents": {
        "en": content,
      }
    });
  }
}

class FileCase {
  File file;
  String keyName;

  FileCase({required this.file, required this.keyName});
}
