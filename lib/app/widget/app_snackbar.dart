import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:test_ximply/app/themes/app_theme.dart';

appSnackbar({String? message = "Terjadi Kesalahan", bool? isError}) {
  Get.closeAllSnackbars();
  Get.rawSnackbar(
    messageText: Builder(builder: (context) {
      return Text(
        message ?? "Terjadi Kesalahan",
        style: context.txtStyl.bodySmall?.copyWith(
          color: context.clrStyl.onPrimary,
        ),
      );
    }),
    backgroundColor: (isError ?? false) == true
        ? (Get.context!).clrStyl.error
        : (Get.context!).clrStyl.primary,
    margin: const EdgeInsets.all(10),
    borderRadius: 10,
  );
}
