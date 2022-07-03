import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:groceries_shop/controller/product_controller.dart';
import 'package:groceries_shop/view/product_detail.dart';
import 'package:groceries_shop/widget/home/item.dart';

class ListItem extends StatelessWidget {
  const ListItem({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
      init: ProductController(),
      builder: (data) => data.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SizedBox(
              height: 250,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) => const SizedBox(
                        width: 20,
                      ),
                  itemCount: data.productFireBase.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      child: items(
                          imagesitem:
                              Image.network(data.productFireBase[index].images),
                          nameitem: (data.productFireBase[index].name),
                          unit: data.productFireBase[index].unit,
                          priceitem: int.parse(data
                              .productFireBase[index].originalPrice
                              .toString())),
                      onTap: () {
                        Get.to(ProductDetail(
                            index: data.productFireBase[index].idProduct!));
                      },
                    );
                  }),
            ),
    );
  }
}
