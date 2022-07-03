import 'package:get/get.dart';
import 'package:groceries_shop/model/favorite.dart';

class FavoriteController extends GetxController {
  double sumfavorite = 0;
  Map<String, Favorite> _favorite = {};
  Map<String, Favorite> get favorites {
    return {..._favorite};
  }

  int get favoriteCount {
    return _favorite.length;
  }

  void addItem(
      {required String favoritetid,
      required String images,
      required String name,
      required String uint,
      required int price,
      required String id}) {
    if (_favorite.containsKey(favoritetid)) {
      _favorite.update(
          favoritetid,
          (value) => Favorite(
              image: value.image,
              name: value.name,
              unit: uint,
              price: value.price,
              id: value.id));
      update();
    } else {
      sumfavorite++;

      _favorite.putIfAbsent(
          favoritetid,
          () => Favorite(
              image: images, name: name, unit: uint, price: price, id: id));
      update();
    }
    update();
  }

  void removeItem(int favoriteid) {
    sumfavorite--;
    update();
    _favorite.remove(favoriteid);
    update();
  }
}
