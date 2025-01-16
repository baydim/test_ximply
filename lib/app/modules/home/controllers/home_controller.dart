import 'package:get/get.dart';
import 'package:test_ximply/app/data/repositories/repos_auth.dart';
import 'package:test_ximply/app/models/response/response_category.dart';
import 'package:test_ximply/app/models/response/response_product.dart';

import '../../../data/repositories/repos_product.dart';

class HomeController extends GetxController {
  var isLoadCategory = true.obs;
  var dataCategory = ResponseCategory(
    status: true,
  ).obs;
  funcGetCategory() async {
    isLoadCategory(true);
    dataCategory.value = await ReposProduct.getCategories();
    isLoadCategory(false);
  }

  /// Get products
  var isLoadProduct = true.obs;
  var dataProduct = ResponseProduct(
    status: true,
  ).obs;
  funcGetProduct() async {
    isLoadProduct(true);
    dataProduct.value = await ReposProduct.getProducts();
    isLoadProduct(false);
  }

  funcGetMe() async {
    var res = await ReposAuth.me();
    if (res.status == true) {
      print(res.data?.name);
    } else {
      print(res.message);
    }
  }

  @override
  void onInit() {
    funcGetCategory();
    funcGetProduct();
    funcGetMe();
    super.onInit();
  }
}
