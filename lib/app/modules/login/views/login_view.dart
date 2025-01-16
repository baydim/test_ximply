import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:test_ximply/app/themes/app_theme.dart';

import '../../../routes/app_pages.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
          centerTitle: false,
        ),
        body: Form(
          key: controller.formKey.value,
          child: ListView(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            children: [
              const SizedBox(
                height: kToolbarHeight * 2,
              ),
              Center(
                child: Text(
                  "Welcome Back to Ximply",
                  style: context.txtStyl.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),

              Text(
                "Email",
                style: context.txtStyl.bodyLarge,
              ),
              const SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: controller.emailController,
                decoration: InputDecoration(
                  isDense: true,
                  hintText: "Enter email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (v) {
                  if (v == null || v.isEmpty) {
                    return "Email is required";
                  } else if (!GetUtils.isEmail(v)) {
                    return "Email is invalid";
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "Password",
                style: context.txtStyl.bodyLarge,
              ),
              const SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: controller.passwordController,
                obscureText: controller.isObscure.value,
                decoration: InputDecoration(
                  isDense: true,
                  hintText: "Enter password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      controller.funcShowHide();
                    },
                    icon: Icon(
                      controller.isObscure.value
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                  ),
                ),
                validator: (v) {
                  if (v == null || v.isEmpty) {
                    return "Password is required";
                  }
                  return null;
                },
              ),
              // text forgot password
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      // Get.toNamed(Routes.FORGOT_PASS);
                    },
                    child: Text(
                      "Forgot Password?",
                      style: context.txtStyl.bodyMedium?.copyWith(
                        color: context.clrStyl.primary,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: context.clrStyl.primary,
                  foregroundColor: context.clrStyl.onPrimary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: controller.isLoadLogin.value
                    ? () {}
                    : () {
                        controller.funcLogin();
                      },
                child: controller.isLoadLogin.value
                    ? Text("Loading...")
                    : Text("Login"),
              ),

              /// dont have an account

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: context.txtStyl.bodyMedium,
                  ),
                  TextButton(
                    onPressed: () {
                      Get.toNamed(
                        Routes.REGISTER,
                      );
                    },
                    child: Text(
                      "Register",
                      style: context.txtStyl.bodyMedium?.copyWith(
                        color: context.clrStyl.primary,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: kToolbarHeight * 4,
              ),
            ],
          ),
        ),
      );
    });
  }
}
