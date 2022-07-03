import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:groceries_shop/controller/cart_controller.dart';
import 'package:groceries_shop/widget/cart/cart_item.dart';

class ListCartItem extends StatelessWidget {
  const ListCartItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
        init: CartController(),
        builder: (CartController listcart) => SizedBox(
              height: Get.height * 0.675,
              child: ListView.separated(
                itemBuilder: (context, index) => cartItem(
                  image: Image.network(
                      listcart.carts.values.toList()[index].image),
                  name: (listcart.carts.values.toList()[index].name),
                  unit: (listcart.carts.values.toList()[index].unit),
                  quantity: listcart.carts.values.toList()[index].soluong,
                  price: listcart.carts.values.toList()[index].price *
                      listcart.carts.values.toList()[index].soluong,
                  onTap: () {
                    listcart
                        .removeItem(listcart.carts.values.toList()[index].id);
                  },
                  onTaptru: () {
                    listcart.updateTru(index);
                  },
                  onTapcong: () {
                    listcart.updateCong(index);
                  },
                ),
                separatorBuilder: (context, index) => const Divider(
                  height: 1,
                ),
                itemCount: listcart.cartCount,
              ),
            ));
  }
}
