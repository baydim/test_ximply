import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:test_ximply/app/themes/app_theme.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Register'),
          centerTitle: true,
        ),
        body: Form(
          key: controller.formKey.value,
          child: ListView(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            children: [
              const SizedBox(
                height: kToolbarHeight,
              ),
              Center(
                child: Text(
                  "Welcome to Ximply",
                  style: context.txtStyl.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),

              Text(
                "Name",
                style: context.txtStyl.bodyLarge,
              ),
              const SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: controller.nameController,
                decoration: InputDecoration(
                  isDense: true,
                  hintText: "Enter Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (v) {
                  if (v == null || v.isEmpty) {
                    return "Name is required";
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 15,
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
              const SizedBox(
                height: 15,
              ),
              Text(
                "Confirm Password",
                style: context.txtStyl.bodyLarge,
              ),
              const SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: controller.confirmPasswordController,
                obscureText: controller.isObscure.value,
                decoration: InputDecoration(
                  isDense: true,
                  hintText: "Enter confirm password",
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
                    return "Confirm Password is required";
                  } else if (v != controller.passwordController.text) {
                    return "Password not match";
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 15,
              ),

              Text(
                "Referral Code",
                style: context.txtStyl.bodyLarge,
              ),
              const SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: controller.referralCodeController,
                decoration: InputDecoration(
                  isDense: true,
                  hintText: "Enter Referral Code",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
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
                onPressed: controller.isLoadRegis.value
                    ? () {}
                    : () {
                        controller.funcRegis();
                      },
                child: controller.isLoadRegis.value
                    ? Text("Loading...")
                    : Text("Register"),
              ),

              /// dont have an account

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "You have an account?",
                    style: context.txtStyl.bodyMedium,
                  ),
                  TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text(
                      "Login",
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
