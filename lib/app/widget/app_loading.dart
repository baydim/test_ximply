import 'package:flutter/material.dart';
import 'package:test_ximply/app/themes/app_theme.dart';

Widget appLoading({required BuildContext context, required String message}) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(),
          const SizedBox(
            height: 20,
          ),
          Text(
            message,
            style: context.txtStyl.bodySmall,
          ),
        ],
      ),
    ),
  );
}

Widget appError(
    {required BuildContext context,
    String? message = "Terjadi kesalahan",
    required VoidCallback onRefresh}) {
  return InkWell(
    onTap: onRefresh,
    child: Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.cloud_off_outlined,
              size: MediaQuery.of(context).size.width / 7,
              color: context.clrStyl.primary,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              message ?? "Terjadi kesalahan",
              style: context.txtStyl.bodySmall,
            ),
          ],
        ),
      ),
    ),
  );
}
