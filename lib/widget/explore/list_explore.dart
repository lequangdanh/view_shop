import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:groceries_shop/controller/product_controller.dart';
import 'package:groceries_shop/widget/home/item.dart';

class ListItemExplore extends StatelessWidget {
  const ListItemExplore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductController productController = Get.find();
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10),
      height: Get.height * 1,
      width: Get.width * 1,
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: productController.productFireBase.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                //Get.to(ProductDetail(index: index));
              },
              child: items(
                  imagesitem: Image.network(
                    productController.productFireBase[index].images,
                    fit: BoxFit.cover,
                  ),
                  nameitem: (productController.productFireBase[index].name),
                  unit: productController.productFireBase[index].unit,
                  priceitem: int.parse(productController
                      .productFireBase[index].originalPrice
                      .toString())),
            );
          }),
    );
  }
}
