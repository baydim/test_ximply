import 'package:test_ximply/app/data/services/service_dio/response_default.dart';
import 'package:test_ximply/app/data/services/service_dio/service_dio.dart';
import 'package:test_ximply/app/data/services/service_dio/url_api.dart';

import '../../models/response/response_category.dart';
import '../../models/response/response_detail_product.dart';
import '../../models/response/response_product.dart';

class ReposProduct {
  static Future<ResponseCategory> getCategories() async {
    try {
      var res = await ServiceDio.getCase(url: UrlApi.categories);
      return responseCategoryFromJson(responseDefaultToJson(res));
    } catch (e) {
      return ResponseCategory(
        status: false,
        message: e.toString(),
        data: [],
      );
    }
  }

  /// Get products
  static Future<ResponseProduct> getProducts() async {
    try {
      var res = await ServiceDio.getCase(url: UrlApi.products);
      return responseProductFromJson(responseDefaultToJson(res));
    } catch (e) {
      return ResponseProduct(
        status: false,
        message: e.toString(),
        data: null,
      );
    }
  }

  /// Get detail product
  static Future<ResponseDetailProduct> getDetailProduct(String id) async {
    try {
      var res = await ServiceDio.getCase(url: "${UrlApi.products}/$id");
      return responseDetailProductFromJson(responseDefaultToJson(res));
    } catch (e) {
      return ResponseDetailProduct(
        status: false,
        message: e.toString(),
        data: null,
      );
    }
  }
}
