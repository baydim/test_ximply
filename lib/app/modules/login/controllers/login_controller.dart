import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_ximply/app/data/repositories/repos_auth.dart';
import 'package:test_ximply/app/data/services/service_shared/service_shared.dart';
import 'package:test_ximply/app/models/response/response_login.dart';
import 'package:test_ximply/app/routes/app_pages.dart';
import 'package:test_ximply/app/widget/app_snackbar.dart';

class LoginController extends GetxController {
  var isLoadLogin = false.obs;
  var formKey = GlobalKey<FormState>().obs;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var isObscure = true.obs;
  funcShowHide() {
    isObscure.value = !isObscure.value;
  }

  funcLogin() async {
    isLoadLogin.value = true;
    if (formKey.value.currentState!.validate()) {
      var res =
          await ReposAuth.login(emailController.text, passwordController.text);
      if (res.status == true) {
        // appSnackbar(
        //   message: res.message,
        //   isError: false,
        // );
        await saveResponseToSession(res);
        Get.offAllNamed(Routes.HOME);
      } else {
        appSnackbar(
          message: res.message,
          isError: true,
        );
      }
    }
    isLoadLogin.value = false;
  }

  Future<bool> saveResponseToSession(ResponseLogin data) async {
    return await ServiceShared.setToken(data);
  }
}
