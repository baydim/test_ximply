import 'package:get/get.dart';
import 'package:test_ximply/app/data/repositories/repos_product.dart';
import '../../../models/response/response_detail_product.dart';
import '../../../models/response/response_product.dart';

class DetailProductController extends GetxController {
  var idProduct = "".obs;
  var isLoadProduct = true.obs;
  var dataProduct = ResponseDetailProduct().obs;
  var count = 1.obs;

  funcGetProdcuct() async {
    isLoadProduct.value = true;
    dataProduct.value = await ReposProduct.getDetailProduct(idProduct.value);
    if (dataProduct.value.status == true) {
      funcGetProduct();
    }
    isLoadProduct.value = false;
  }

  /// Get products
  var isLoadProductList = true.obs;
  var dataProductList = ResponseProduct().obs;
  funcGetProduct() async {
    isLoadProductList(true);
    dataProductList.value = await ReposProduct.getProducts();
    if (dataProductList.value.status == true) {
      dataProductList.value.data?.data
          ?.removeWhere((element) => element.id == idProduct.value);
    }
    isLoadProductList(false);
  }
}
