import 'package:get/get.dart';
import 'package:test_ximply/app/models/response/response_category.dart';
import 'package:test_ximply/app/models/response/response_product.dart';

import '../../../data/repositories/repos_product.dart';

class HomeController extends GetxController {
  var isLoadCategory = true.obs;
  var dataCategory = ResponseCategory().obs;
  funcGetCategory() async {
    isLoadCategory(true);
    dataCategory.value = await ReposProduct.getCategories();
    isLoadCategory(false);
  }

  /// Get products
  var isLoadProduct = true.obs;
  var dataProduct = ResponseProduct().obs;
  funcGetProduct() async {
    isLoadProduct(true);
    dataProduct.value = await ReposProduct.getProducts();
    isLoadProduct(false);
  }

  @override
  void onInit() {
    funcGetCategory();
    funcGetProduct();
    super.onInit();
  }
}
