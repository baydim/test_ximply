import 'package:test_ximply/app/data/services/service_dio/response_default.dart';
import 'package:test_ximply/app/data/services/service_dio/service_dio.dart';
import 'package:test_ximply/app/data/services/service_dio/url_api.dart';
import 'package:test_ximply/app/models/response/response_login.dart';

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
    } catch (e, stack) {
      print(stack);
      return ResponseLogin(
        status: false,
        message: e.toString(),
      );
    }
  }
}
