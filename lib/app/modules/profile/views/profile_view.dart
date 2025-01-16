import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:test_ximply/app/themes/app_theme.dart';
import 'package:test_ximply/app/widget/app_loading.dart';

import '../../../util/text_formatter.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
          centerTitle: true,
        ),
        body: controller.isLoad.value
            ? appLoading(context: context, message: "Loading...")
            : controller.dataMe.value.status == false
                ? appError(
                    context: context,
                    onRefresh: () {
                      controller.funcGetMe();
                    },
                    message: controller.dataMe.value.message,
                  )
                : ListView(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        child: Stack(
                          children: [
                            Text(
                              aliasName(
                                name: controller.dataMe.value.data?.name ?? "",
                              ),
                              style: context.txtStyl.titleMedium?.copyWith(
                                color: context.clrStyl.primary,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        controller.dataMe.value.data?.name ?? "",
                        style: context.txtStyl.titleMedium?.copyWith(
                          color: context.clrStyl.primary,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        controller.dataMe.value.data?.email ?? "",
                        style: context.txtStyl.bodyMedium?.copyWith(
                          color: context.clrStyl.primary,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      Container(
                        margin: EdgeInsets.all(15),
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: context.clrStyl.primaryContainer,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(child: Text("Referral Code: ")),
                                SizedBox(
                                  width: 10,
                                ),
                                InkWell(
                                  onTap: () {
                                    controller.funcCopyReferral();
                                  },
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.copy,
                                        size: 13,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "Copy",
                                        style: context.txtStyl.bodySmall,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Divider(),
                            Text(
                              controller.dataMe.value.data?.referralCode ?? "",
                              style: context.txtStyl.titleMedium?.copyWith(
                                color: context.clrStyl.primary,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(
            left: 15,
            right: 15,
            bottom: 15,
          ),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: context.clrStyl.errorContainer,
              foregroundColor: context.clrStyl.error,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {
              controller.funcLogout();
            },
            child: Text("Logout"),
          ),
        ),
      );
    });
  }
}
