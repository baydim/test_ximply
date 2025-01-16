import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/response/response_login.dart';

class ServiceShared {
  // set token
  static Future<bool> setToken(ResponseLogin token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(
      'token',
      responseLoginToJson(token),
    );
  }

  // get token
  static Future<ResponseLogin?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    if (token != null) {
      return responseLoginFromJson(token);
    }
    return null;
  }

  // remove token
  static Future<bool> removeToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.remove('token');
  }
}
