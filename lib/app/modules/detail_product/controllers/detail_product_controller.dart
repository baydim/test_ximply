import 'package:get/get.dart';
import 'package:test_ximply/app/data/repositories/repos_product.dart';
import '../../../models/response/response_detail_product.dart';

class DetailProductController extends GetxController {
  var idProduct = "".obs;
  var isLoadProduct = true.obs;
  var dataProduct = ResponseDetailProduct().obs;
  funcGetProdcuct() async {
    isLoadProduct.value = true;
    dataProduct.value = await ReposProduct.getDetailProduct(idProduct.value);
    isLoadProduct.value = false;
  }
}
