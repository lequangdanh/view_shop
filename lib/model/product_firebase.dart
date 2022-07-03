import 'package:cloud_firestore/cloud_firestore.dart';

class ProductFireBase {
  final String? idProduct;
  final String name;
  final String images;
  final String describe;
  final String type;
  final String unit;
  final int star;
  final int sale;
  final int originalPrice;
  ProductFireBase({
    this.idProduct,
    required this.name,
    required this.images,
    required this.describe,
    required this.type,
    required this.star,
    required this.sale,
    required this.unit,
    required this.originalPrice,
  });

  ProductFireBase.fromDocumentSnapshot(
      DocumentSnapshot<Map<String, dynamic>> doc)
      : idProduct = doc.id,
        name = doc.data()!["name"],
        images = doc.data()!["images"],
        describe = doc.data()!["describe"],
        type = doc.data()!["type"],
        star = doc.data()!["star"],
        sale = doc.data()!["sale"],
        unit = doc.data()!["unit"],
        originalPrice = doc.data()!["originalPrice"];
}
