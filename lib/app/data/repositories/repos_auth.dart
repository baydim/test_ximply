import 'package:test_ximply/app/data/services/service_dio/response_default.dart';
import 'package:test_ximply/app/data/services/service_dio/service_dio.dart';
import 'package:test_ximply/app/data/services/service_dio/url_api.dart';
import 'package:test_ximply/app/models/payload/payload_register.dart';
import 'package:test_ximply/app/models/response/response_auth_me.dart';
import 'package:test_ximply/app/models/response/response_login.dart';

import '../../models/response/response_auth_regis.dart';

class ReposAuth {
  static Future<ResponseLogin> login(String email, String password) async {
    try {
      var res = await ServiceDio.postCase(
        url: UrlApi.authLogin,
        body: {
          "email": email,
          "password": password,
        },
      );
      return responseLoginFromJson(
        responseDefaultToJson(
          res,
        ),
      );
    } catch (e) {
      return ResponseLogin(
        status: false,
        message: e.toString(),
      );
    }
  }

  /// register
  static Future<ResponseAuthRegis> register(
    PayloadRegister data,
  ) async {
    try {
      var res = await ServiceDio.postCase(
        url: UrlApi.authRegister,
        body: data.toJson(),
      );
      return responseAuthRegisFromJson(
        responseDefaultToJson(
          res,
        ),
      );
    } catch (e) {
      return ResponseAuthRegis(
        status: false,
        message: e.toString(),
      );
    }
  }

  /// me
  static Future<ResponseAuthMe> me() async {
    try {
      var res = await ServiceDio.getCase(
        url: UrlApi.me,
      );
      return responseAuthMeFromJson(
        responseDefaultToJson(
          res,
        ),
      );
    } catch (e) {
      return ResponseAuthMe(
        status: false,
        message: e.toString(),
      );
    }
  }
}
