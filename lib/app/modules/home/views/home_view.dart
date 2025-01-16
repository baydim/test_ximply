import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:test_ximply/app/themes/app_theme.dart';
import 'package:test_ximply/app/util/text_formatter.dart';

import '../../../models/response/response_category.dart';
import '../../../models/response/response_product.dart' hide Image;
import '../../../widget/card_product.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Ximply'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            if (controller.isLoadCategory.value)
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SizedBox(
                      width: 15,
                    ),
                    for (var i in [1, 2, 3, 4, 5, 6, 7, 8])
                      Row(
                        children: [
                          ActionChip(
                            label: Text("    "),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    SizedBox(
                      width: 5,
                    ),
                  ],
                ),
              )
            else
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SizedBox(
                      width: 15,
                    ),
                    for (var i
                        in controller.dataCategory.value.data ?? <Categori>[])
                      Row(
                        children: [
                          ActionChip(
                            label: Text(i.name ?? ""),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    SizedBox(
                      width: 5,
                    ),
                  ],
                ),
              ),
            if (controller.isLoadProduct.value)
              Expanded(
                child: GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  childAspectRatio: 3 / 5,
                  children: [
                    for (var i in [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]) Card(),
                  ],
                ),
              )
            else
              Expanded(
                child: GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  childAspectRatio: 3 / 5,
                  children: [
                    for (var i in controller.dataProduct.value.data?.data ??
                        <Product>[])
                      CardProduct(
                        product: i,
                      ),
                  ],
                ),
              ),
          ],
        ),
      );
    });
  }
}
