import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_ximply/app/modules/detail_product/views/detail_product_view.dart';
import 'package:test_ximply/app/themes/app_theme.dart';

import '../models/response/response_product.dart' hide Image;
import '../util/text_formatter.dart';

class CardProduct extends StatefulWidget {
  const CardProduct({super.key, required this.product});
  final Product product;

  @override
  State<CardProduct> createState() => _CardProductState();
}

class _CardProductState extends State<CardProduct> {
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      child: Stack(
        children: [
          SizedBox.expand(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  flex: 1,
                  child: Image.network(
                    (widget.product.images?.isNotEmpty == true
                            ? widget.product.images!.first.imagePath
                            : "") ??
                        "",
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: SizedBox(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            widget.product.name ?? "",
                            style: context.txtStyl.labelSmall,
                            textAlign: TextAlign.left,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Rp ${numToStringRupiah(data: num.parse(
                              widget.product.price ?? "0.0",
                            ))}",
                            style: context.txtStyl.bodyMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            "Rp ${numToStringRupiah(data: num.parse(
                              widget.product.priceMember ?? "0.0",
                            ))}",
                            style: context.txtStyl.bodySmall?.copyWith(
                              color: context.clrStyl.primary,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: context.clrStyl.primaryContainer,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5,
                            ),
                            child: Text(
                              widget.product.category?.name ?? "",
                              style: context.txtStyl.labelSmall?.copyWith(
                                color: context.clrStyl.primary,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            widget.product.description ?? "",
                            style: context.txtStyl.labelSmall?.copyWith(
                              fontWeight: FontWeight.normal,
                            ),
                            textAlign: TextAlign.left,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  Get.to(
                    () => DetailProductView(id: widget.product.id ?? ""),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
