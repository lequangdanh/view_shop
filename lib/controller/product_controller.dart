import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:groceries_shop/model/product.dart';
import 'package:groceries_shop/model/product_firebase.dart';

class ProductController extends GetxController {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  //List<Product> listdata = <Product>[];

  List<ProductFireBase> productFireBase = <ProductFireBase>[];
  bool isLoading = false;
  int qantity = 1;
  late Iterable<Product> findata;

  void onInit() {
    super.onInit();
    getProductFireBase();
    print("ta ti tu" + productFireBase.length.toString());
    // getdata();
  }

  void Increment() {
    qantity++;
    update();
  }

  void Decrement() {
    if (qantity == 0) {
      Get.back();
      update();
    } else {
      qantity--;
      update();
    }
  }

  void updatequntity() {
    qantity = 1;
    update();
  }

  List<ProductFireBase> getDetail(String id) {
    return productFireBase
        .where((element) => element.idProduct!.contains(id))
        .toList();
  }

  List<ProductFireBase> selectProduct(String type) {
    return productFireBase
        .where((element) =>
            element.type.contains(type) || element.name.contains(type))
        .toList();
  }

  // void deletelist() {
  //   listexplore.clear();
  //   update();
  // }

  Future<List<ProductFireBase>> getProductFireBase() async {
    isLoading = true;
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await _db.collection("products").get();
    productFireBase.addAll(snapshot.docs
        .map((docSnapshot) => ProductFireBase.fromDocumentSnapshot(docSnapshot))
        .toList());
    isLoading = false;
    update();

    return productFireBase;
  }
}
