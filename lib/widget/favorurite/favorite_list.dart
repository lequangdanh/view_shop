import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:groceries_shop/controller/favorite_controller.dart';
import 'package:groceries_shop/widget/favorurite/favorurite.dart';

class ListFavorite extends StatelessWidget {
  const ListFavorite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FavoriteController>(
      init: FavoriteController(),
      builder: (FavoriteController data) => SizedBox(
        height: Get.height * 0.7,
        child: ListView.separated(
          itemBuilder: (context, index) => favoritesItem(
              image: Image.network(
                  data.favorites.values.toList()[index].image),
              name: (data.favorites.values.toList()[index].name),
              unit: data.favorites.values.toList()[index].unit,
              price: data.favorites.values.toList()[index].price,
              onTap: () {
                //Get.to(ProductDetail(index: (data.favorites.values.toList()[index].id.toString())));
              }),
          separatorBuilder: (context, index) => const Divider(
            height: 1,
          ),
          itemCount: data.favoriteCount,
        ),
      ),
    );
  }
}
