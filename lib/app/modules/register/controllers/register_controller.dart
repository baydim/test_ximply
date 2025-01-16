import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_ximply/app/models/payload/payload_register.dart';
import 'package:test_ximply/app/widget/app_snackbar.dart';

import '../../../data/repositories/repos_auth.dart';

class RegisterController extends GetxController {
  var formKey = GlobalKey<FormState>().obs;
  var isLoadRegis = false.obs;
  var isObscure = true.obs;
  funcShowHide() {
    isObscure.value = !isObscure.value;
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController referralCodeController = TextEditingController();

  funcRegis() async {
    isLoadRegis.value = true;
    if (formKey.value.currentState!.validate()) {
      var res = await ReposAuth.register(
        PayloadRegister(
          email: emailController.text,
          password: passwordController.text,
          passwordConfirmation: confirmPasswordController.text,
          name: nameController.text,
          referralCode: referralCodeController.text.isEmpty
              ? null
              : referralCodeController.text,
          isWhatsapp: false,
        ),
      );
      if (res.status == false) {
        appSnackbar(
          message: res.message,
          isError: true,
        );
      } else {
        Get.back();
        appSnackbar(
          message: res.message,
          isError: false,
        );
      }
    }

    isLoadRegis.value = false;
  }
}
