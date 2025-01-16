import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:test_ximply/app/themes/app_theme.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "TEST XIMPLY",
          style: context.txtStyl.bodyLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
