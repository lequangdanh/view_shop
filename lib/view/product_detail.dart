import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:groceries_shop/controller/cart_controller.dart';
import 'package:groceries_shop/controller/favorite_controller.dart';
import 'package:groceries_shop/controller/home_controller.dart';
import 'package:groceries_shop/controller/product_controller.dart';
import 'package:groceries_shop/view/home/home_screen.dart';
import 'package:groceries_shop/widget/buttons.dart';
import 'package:groceries_shop/widget/home/slider.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({Key? key, required this.index}) : super(key: key);
  final String index;

  @override
  Widget build(BuildContext context) {
    ProductController productController = Get.find();
    HomeController homeController = Get.find();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF2F3F2),
        elevation: 0,
        leading: GestureDetector(
          child: Image.asset("asset/images/backblack.png"),
          onTap: () {
            Get.back();
          },
        ),
        leadingWidth: 60,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: GetBuilder<ProductController>(
          init: ProductController(),
          builder: (ProductController data) => data.isLoading
              ? SizedBox(
                  height: Get.height * 0.5,
                  width: Get.width,
                  child: const CircularProgressIndicator(),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    sliders(
                        image1: Image.network(
                          data.getDetail(index).elementAt(0).images,
                          fit: BoxFit.fill,
                        ),
                        image2: Image.network(
                          data.getDetail(index).elementAt(0).images,
                          fit: BoxFit.fill,
                        ),
                        image3: Image.network(
                          data.getDetail(index).elementAt(0).images,
                          fit: BoxFit.fill,
                        ),
                        height: Get.height * 0.27),
                    const Padding(padding: EdgeInsets.only(top: 20)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          (data.getDetail(index).elementAt(0).name),
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        GetBuilder<FavoriteController>(
                          init: FavoriteController(),
                          builder: (FavoriteController favoritess) =>
                              GestureDetector(
                            child: const Icon(
                              Icons.home,
                              color: Colors.black,
                            ), //Image.asset("asset/images/love.png"),
                            onTap: () {
                              favoritess.addItem(
                                favoritetid: data
                                    .getDetail(index)
                                    .elementAt(0)
                                    .idProduct!,
                                images:
                                    data.getDetail(index).elementAt(0).images,
                                name: data.getDetail(index).elementAt(0).name,
                                uint: data.getDetail(index).elementAt(0).unit,
                                price: int.parse(data
                                    .getDetail(index)
                                    .elementAt(0)
                                    .originalPrice
                                    .toString()),
                                id: data
                                    .getDetail(index)
                                    .elementAt(0)
                                    .idProduct!,
                              );
                            },
                          ),
                        )
                      ],
                    ),
                    Text(
                      data.getDetail(index).elementAt(0).unit,
                    ),
                    const Padding(padding: EdgeInsets.only(top: 20)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              child: Image.asset("asset/images/tru.png"),
                              onTap: () {
                                data.Decrement();
                              },
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            SizedBox(
                              child: Text("${(data.qantity)}"),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            GestureDetector(
                              child: Image.asset("asset/images/cong2.png"),
                              onTap: () {
                                data.Increment();
                              },
                            )
                          ],
                        ),
                        Text(
                            "\$${(data.getDetail(index).elementAt(0).originalPrice) * data.qantity}"),
                      ],
                    ),
                    const Padding(padding: EdgeInsets.only(top: 20)),
                    const Divider(
                      height: 1,
                      color: Color(0xFFE2E2E2),
                    ),
                    const Padding(padding: EdgeInsets.only(top: 10)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Product Detail",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Image.asset("asset/images/backdown.png"),
                      ],
                    ),
                    const Padding(padding: EdgeInsets.only(top: 10)),
                    const Text(
                        "Apples are nutritious. Apples may be good for weight loss. apples may be good for your heart. As part of a healtful and varied diet."),
                    const Padding(padding: EdgeInsets.only(top: 10)),
                    const Divider(
                      height: 1,
                      color: Color(0xFFE2E2E2),
                    ),
                    const Padding(padding: EdgeInsets.only(top: 10)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Nutritions",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Row(
                          children: [
                            const Text("100gr"),
                            const SizedBox(
                              width: 20,
                            ),
                            Image.asset("asset/images/backblack.png"),
                          ],
                        ),
                      ],
                    ),
                    const Padding(padding: EdgeInsets.only(top: 10)),
                    const Divider(
                      height: 1,
                      color: Color(0xFFE2E2E2),
                    ),
                    const Padding(padding: EdgeInsets.only(top: 10)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Review",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Row(
                          children: [
                            Image.asset("asset/images/star.png"),
                            Image.asset("asset/images/star.png"),
                            Image.asset("asset/images/star.png"),
                            Image.asset("asset/images/star.png"),
                            Image.asset("asset/images/star.png"),
                            const SizedBox(
                              width: 10,
                            ),
                            Image.asset("asset/images/backblack.png"),
                          ],
                        ),
                      ],
                    ),
                    const Padding(padding: EdgeInsets.only(top: 20)),
                    GetBuilder<CartController>(
                      init: CartController(),
                      builder: (cart) => buttons(
                          name: "Add To Basket",
                          colors: const Color(0xFF53B175),
                          withbutton: 364,
                          heightbutton: 67,
                          onTap: () {
                            cart.addItem(
                                cartid: data
                                    .getDetail(index)
                                    .elementAt(0)
                                    .idProduct!,
                                images:
                                    data.getDetail(index).elementAt(0).images,
                                name: data.getDetail(index).elementAt(0).name,
                                unit: data.getDetail(index).elementAt(0).unit,
                                price: data
                                    .getDetail(index)
                                    .elementAt(0)
                                    .originalPrice
                                    .toDouble(),
                                soluong: data.qantity,
                                id: data
                                    .getDetail(index)
                                    .elementAt(0)
                                    .idProduct!);
                            homeController.updateIndex(2);

                            Get.to(const HomeScreen());
                            data.updatequntity();

                            // productController.deletelist();
                          }),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
