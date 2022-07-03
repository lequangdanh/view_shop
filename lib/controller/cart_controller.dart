import 'package:get/get.dart';
import 'package:groceries_shop/model/cart_firebase.dart';

import '../model/cart.dart';

class CartController extends GetxController {
  List<CartFireBase> cartFireBase = <CartFireBase>[];
  //double sumCartPrice = 0;
  double sumCart = 0;
  //int totalCart = 0;
  // final FirebaseFirestore _db = FirebaseFirestore.instance;
  // void onInit() {
  //   super.onInit();
  //   getCartFireBase();
  // }

  //final FirebaseAuth auth = FirebaseAuth.instance;

  //get userId => auth.currentUser!.uid;
  Map<String, Cart> _cart = {};
  Map<String, Cart> get carts {
    return {..._cart};
  }

  int get cartCount {
    return _cart.length;
  }

  void cartCountt() {
    _cart.toString();
  }

  double get totalCart {
    double sumCartPrice = 0;
    _cart.forEach((key, value) {
      sumCartPrice += (value.price * value.soluong);
    });

    return sumCartPrice;
  }

  void addItem(
      {required String cartid,
      required String images,
      required String name,
      required String unit,
      required double price,
      required int soluong,
      required String id}) {
    if (_cart.containsKey(cartid)) {
      _cart.update(
          cartid,
          (value) => Cart(
              image: value.image,
              name: value.name,
              unit: value.unit,
              price: value.price,
              soluong: value.soluong,
              id: value.id));
      update();
    } else {
      sumCart++;

      _cart.putIfAbsent(
          cartid,
          () => Cart(
              image: images,
              name: name,
              unit: unit,
              price: price,
              soluong: soluong,
              id: id));
      update();
    }
    update();
  }

  void removeItem(String cartid) {
    sumCart--;
    _cart.remove(cartid);
    update();
  }

  void updateCong(int id) {
    _cart.values.toList()[id].soluong++;
    update();
  }

  void updateTru(int id) {
    if (_cart.values.toList()[id].soluong == 0) {
      Get.back();
    } else {
      _cart.values.toList()[id].soluong--;
      update();
    }
    update();
  }

  // addCart(CartFireBase cartFireBase) async {
  //   await _db.collection("carts").add(cartFireBase.toMap());
  // }
  //
  // updateCart(CartFireBase cartFireBase) async {
  //   await _db
  //       .collection("carts")
  //       .doc(cartFireBase.idCart)
  //       .update(cartFireBase.toMap());
  // }
  //
  // Future<void> deleteCart(String idCart) async {
  //   await _db.collection("carts").doc(idCart).delete();
  // }
  //
  // Future<List<CartFireBase>> getCartFireBase() async {
  //   QuerySnapshot<Map<String, dynamic>> snapshot =
  //       await _db.collection("carts").get();
  //   cartFireBase.addAll(snapshot.docs
  //       .map((docSnapshot) => CartFireBase.fromDocumentSnapshot(docSnapshot))
  //       .toList());
  //   return cartFireBase;
  // }
  //
  // List<CartFireBase> getCartUser() {
  //   print(userId);
  //   print(cartFireBase
  //       .where((element) => element.idUser.contains(userId))
  //       .toList());
  //   return cartFireBase
  //       .where((element) => element.idUser.contains(userId))
  //       .toList();
  // }
}
