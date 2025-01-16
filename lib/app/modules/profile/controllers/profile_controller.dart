import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:test_ximply/app/data/services/service_shared/service_shared.dart';
import 'package:test_ximply/app/models/response/response_auth_me.dart';
import 'package:test_ximply/app/routes/app_pages.dart';
import 'package:test_ximply/app/widget/app_snackbar.dart';

import '../../../data/repositories/repos_auth.dart';

class ProfileController extends GetxController {
  var isLoad = true.obs;
  var dataMe = ResponseAuthMe().obs;
  funcGetMe() async {
    isLoad(true);
    dataMe.value = await ReposAuth.me();
    if (dataMe.value.status == true) {
      if (kDebugMode) {
        print(dataMe.value.data?.name);
      }
    } else {
      if (kDebugMode) {
        print(dataMe.value.message);
      }
    }
    isLoad(false);
  }

  funcLogout() async {
    await ServiceShared.removeToken();
    Get.offAllNamed(Routes.SPLASH);
  }

  funcCopyReferral() {
    Clipboard.setData(
        ClipboardData(text: dataMe.value.data?.referralCode ?? ""));
    appSnackbar(
      message: "Referral code copied",
      isError: false,
    );
  }

  @override
  void onInit() {
    funcGetMe();
    super.onInit();
  }
}
