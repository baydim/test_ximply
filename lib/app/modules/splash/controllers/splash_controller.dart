import 'package:get/get.dart';
import 'package:test_ximply/app/data/services/service_shared/service_shared.dart';
import 'package:test_ximply/app/routes/app_pages.dart';

class SplashController extends GetxController {
  // cek session
  Future<void> cekSession() async {
    await Future.delayed(Duration(seconds: 2));
    var data = await ServiceShared.getToken();
    if (data != null) {
      Get.offAllNamed(Routes.HOME);
    } else {
      Get.offAllNamed(Routes.LOGIN);
    }
  }

  @override
  void onReady() {
    cekSession();
    super.onReady();
  }
}
