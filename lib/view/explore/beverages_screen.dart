import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:groceries_shop/controller/product_controller.dart';
import 'package:groceries_shop/widget/home/item.dart';

import '../product_detail.dart';

class BeveragesScreen extends StatelessWidget {
  BeveragesScreen({Key? key, required this.search}) : super(key: key);
  String search;
  @override
  Widget build(BuildContext context) {
    ProductController productController = Get.find();
    return productController.selectProduct(search).isEmpty
        ? Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              leading: GestureDetector(
                child: Image.asset("asset/images/backblack.png"),
                onTap: () {
                  Get.back();
                },
              ),
              title: Center(
                child: Text(
                  "Search for key\"${(search)}\"",
                  style: const TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
              actions: [
                Image.asset("asset/images/action.png"),
              ],
            ),
            body: Center(
              child: Text(
                "Not Found Result for key\"${(search)}\"",
                style: const TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
          )
        : Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              leading: GestureDetector(
                child: Image.asset("asset/images/backblack.png"),
                onTap: () {
                  Get.back();
                },
              ),
              title: Center(
                child: Text(
                  "Search for key\"${(search)}\"",
                  style: const TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
              actions: [
                Image.asset("asset/images/action.png"),
              ],
            ),
            body: SingleChildScrollView(
              child: SafeArea(
                  child: Container(
                padding: const EdgeInsets.only(left: 13, right: 13, top: 20),
                height: Get.height * 1,
                width: Get.width * 1,
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 280,
                            mainAxisExtent: 250,
                            crossAxisSpacing: 15,
                            mainAxisSpacing: 15),
                    itemCount: productController.selectProduct(search).length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          Get.to(ProductDetail(
                              index: productController
                                  .productFireBase[index].idProduct!));
                        },
                        child: items(
                            imagesitem: Image.network(productController
                                .selectProduct(search)
                                .toList()[index]
                                .images),
                            nameitem: (productController
                                .selectProduct(search)
                                .toList()[index]
                                .name),
                            unit: productController
                                .selectProduct(search)
                                .toList()[index]
                                .unit,
                            priceitem: int.parse(productController
                                .selectProduct(search)
                                .toList()[index]
                                .originalPrice
                                .toString())),
                      );
                    }),
              )),
            ),
          );
  }
}
