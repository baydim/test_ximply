// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:test_ximply/app/models/response/response_detail_product.dart';
import 'package:test_ximply/app/themes/app_theme.dart';
import 'package:test_ximply/app/util/text_formatter.dart';
import 'package:test_ximply/app/widget/app_loading.dart';
import 'package:test_ximply/app/widget/app_snackbar.dart';
import '../../../models/response/response_product.dart' hide Shipper, Image;
import '../../../widget/card_product.dart';
import '../controllers/detail_product_controller.dart';

class DetailProductView extends StatefulWidget {
  const DetailProductView({super.key, required this.id});
  final String id;

  @override
  State<DetailProductView> createState() => _DetailProductViewState();
}

class _DetailProductViewState extends State<DetailProductView> {
  late DetailProductController controller;

  @override
  void initState() {
    controller = Get.put<DetailProductController>(
      DetailProductController(),
      tag: widget.id,
    );

    controller.idProduct.value = widget.id;
    controller.funcGetProdcuct();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Scaffold(
          appBar: AppBar(
            title: Text("Detail"),
          ),
          body: controller.isLoadProduct.value
              ? appLoading(context: context, message: "Loading...")
              : controller.dataProduct.value.status == false
                  ? appError(
                      context: context,
                      message: controller.dataProduct.value.message,
                      onRefresh: () {
                        controller.funcGetProdcuct();
                      },
                    )
                  : ListView(
                      children: [
                        AspectRatio(
                          aspectRatio: 1 / 1,
                          child: Stack(
                            children: [
                              Positioned.fill(
                                child: PageView(
                                  children: [
                                    for (var i in controller
                                            .dataProduct.value.data?.images ??
                                        <ImageProd>[])
                                      Image.network(
                                        i.imagePath ?? "",
                                        fit: BoxFit.cover,
                                      ),
                                  ],
                                ),
                              ),
                              Positioned(
                                  left: 20,
                                  right: 20,
                                  bottom: 20,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      for (var i in controller
                                              .dataProduct.value.data?.images ??
                                          <ImageProd>[])
                                        Container(
                                          width: 8,
                                          height: 8,
                                          margin: EdgeInsets.only(right: 5),
                                          decoration: BoxDecoration(
                                            color: context
                                                .clrStyl.primaryContainer,
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                    ],
                                  ))
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                            controller.dataProduct.value.data?.name ?? "",
                            style: context.txtStyl.titleMedium,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                            "Rp ${numToStringRupiah(data: num.parse(controller.dataProduct.value.data?.price ?? "0.0"))}",
                            style: context.txtStyl.bodyLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            children: [
                              Text(
                                "Rp ${numToStringRupiah(data: num.parse(controller.dataProduct.value.data?.priceMember ?? "0.0"))}",
                                style: context.txtStyl.bodyMedium?.copyWith(
                                  color: context.clrStyl.primary,
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(
                                Icons.confirmation_num,
                                color: context.clrStyl.primary,
                                size: 18,
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            children: [
                              Text(
                                "SKU : ",
                                style: context.txtStyl.bodyMedium?.copyWith(),
                              ),
                              Text(
                                controller.dataProduct.value.data?.sku ?? "",
                                style: context.txtStyl.bodyMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: context.clrStyl.primary,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            children: [
                              Text(
                                "STOCK : ",
                                style: context.txtStyl.bodyMedium?.copyWith(),
                              ),
                              Text(
                                (controller.dataProduct.value.data?.stock ?? 0)
                                    .toString(),
                                style: context.txtStyl.bodyMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: context.clrStyl.primary,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            children: [
                              Text(
                                "WEIGHT : ",
                                style: context.txtStyl.bodyMedium?.copyWith(),
                              ),
                              Text(
                                (controller.dataProduct.value.data?.shipping
                                            ?.weight ??
                                        0)
                                    .toString(),
                                style: context.txtStyl.bodyMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: context.clrStyl.primary,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            children: [
                              Text(
                                "LENGHT : ",
                                style: context.txtStyl.bodyMedium?.copyWith(),
                              ),
                              Text(
                                (controller.dataProduct.value.data?.shipping
                                            ?.length ??
                                        0)
                                    .toString(),
                                style: context.txtStyl.bodyMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: context.clrStyl.primary,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            children: [
                              Text(
                                "WIDTH : ",
                                style: context.txtStyl.bodyMedium?.copyWith(),
                              ),
                              Text(
                                (controller.dataProduct.value.data?.shipping
                                            ?.width ??
                                        0)
                                    .toString(),
                                style: context.txtStyl.bodyMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: context.clrStyl.primary,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            children: [
                              Text(
                                "HEIGHT : ",
                                style: context.txtStyl.bodyMedium?.copyWith(),
                              ),
                              Text(
                                (controller.dataProduct.value.data?.shipping
                                            ?.height ??
                                        0)
                                    .toString(),
                                style: context.txtStyl.bodyMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: context.clrStyl.primary,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                            "Deskripsi",
                            style: context.txtStyl.titleMedium,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                            controller.dataProduct.value.data?.description ??
                                "",
                            style: context.txtStyl.bodyMedium,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                            "Shippers",
                            style: context.txtStyl.titleMedium,
                          ),
                        ),
                        for (var i
                            in controller.dataProduct.value.data?.shippers ??
                                <Shipper>[])
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Text(
                              "- ${i.name ?? ""}",
                              style: context.txtStyl.bodyMedium,
                            ),
                          ),
                        SizedBox(
                          height: kToolbarHeight,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                            "Produk Rekomendasi",
                            style: context.txtStyl.titleMedium,
                          ),
                        ),
                        GridView.count(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          crossAxisCount: 2,
                          childAspectRatio: 3 / 5,
                          children: [
                            for (var i in controller
                                    .dataProductList.value.data?.data ??
                                <Product>[])
                              CardProduct(
                                product: i,
                              ),
                          ],
                        ),
                        SizedBox(
                          height: kToolbarHeight * 2,
                        ),
                      ],
                    ),
          bottomNavigationBar: controller.isLoadProduct.value == true ||
                  controller.dataProduct.value.status == false
              ? null
              : Padding(
                  padding:
                      const EdgeInsets.only(left: 15, right: 15, bottom: 15),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            /// icon button counter min -, 1, icon button counter +
                            IconButton(
                              onPressed: () {
                                if (controller.count.value > 1) {
                                  controller.count.value--;
                                }
                              },
                              icon: Icon(Icons.remove),
                            ),

                            /// text counter
                            Text(controller.count.value.toString()),

                            /// icon button counter +
                            IconButton(
                              onPressed: () {
                                final stock =
                                    controller.dataProduct.value.data?.stock ??
                                        0;
                                if (controller.count.value < stock) {
                                  controller.count.value++;
                                } else {
                                  appSnackbar(
                                    message: "Stock tidak mencukupi",
                                    isError: true,
                                  );
                                }
                              },
                              icon: Icon(Icons.add),
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: context.clrStyl.primary,
                          foregroundColor: context.clrStyl.onPrimary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {},
                        child: SizedBox(
                          width: double.infinity,
                          child: Center(
                            child: Text("Check Out Now"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }
}
