import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'response_default.dart';

ResponseDefault funcDioExceptionHandler(DioException e) {
  switch (e.type) {
    case DioExceptionType.cancel:
      return ResponseDefault(
        status: false,
        message: 'Perintah dibatalkan',
        data: null,
      );
    case DioExceptionType.connectionTimeout:
      return ResponseDefault(
        status: false,
        message: kDebugMode ? 'Koneksi timeout' : 'Waktu koneksi habis',
        data: null,
      );
    case DioExceptionType.unknown:
      return ResponseDefault(
        status: false,
        message: 'Mohon periksa koneksi internet anda',
        data: null,
      );
    case DioExceptionType.receiveTimeout:
      return ResponseDefault(
        status: false,
        message: kDebugMode ? "Receive timeout" : "Waktu koneksi habis",
        data: null,
      );
    case DioExceptionType.badResponse:
      return ResponseDefault(
        status: false,
        message: e.response?.data['message'] ??
            e.response?.data['error'] ??
            'Received invalid status code: ${e.response?.statusCode}',
        data: null,
      );
    case DioExceptionType.sendTimeout:
      return ResponseDefault(
        status: false,
        message: kDebugMode ? "Send timeout" : "Waktu koneksi habis",
        data: null,
      );
    case DioExceptionType.badCertificate:
      return ResponseDefault(
        status: false,
        message: kDebugMode ? "Bad certificate" : "Kesalahan setifikat",
        data: null,
      );
    default:
      return ResponseDefault(
        status: false,
        message: kDebugMode
            ? 'Please check your internet connection'
            : 'Mohon periksa koneksi internet anda',
        data: null,
      );
  }
}
