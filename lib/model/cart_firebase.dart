import 'package:cloud_firestore/cloud_firestore.dart';

class CartFireBase {
  final String idCart;
  final String? idProduct;
  final String idUser;
  final int amount;
  final String address;
  final String images;
  final String name;
  final String phoneNumber;
  final int sale;
  final int originalPrice;
  final int total;
  CartFireBase({
    required this.idCart,
    this.idProduct,
    required this.name,
    required this.images,
    required this.idUser,
    required this.amount,
    required this.address,
    required this.sale,
    required this.phoneNumber,
    required this.total,
    required this.originalPrice,
  });
  Map<String, dynamic> toMap() {
    return {
      "idProduct": idProduct,
      "name": name,
      "images": images,
      "idUser": idUser,
      "amount": amount,
      "address": address,
      "sale": sale,
      "phoneNumber": phoneNumber,
      "total": total,
      "originalPrice": originalPrice
    };
  }

  CartFireBase.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : idCart = doc.id,
        idProduct = doc.data()!["idProduct"],
        name = doc.data()!["name"],
        images = doc.data()!["images"],
        idUser = doc.data()!["idUser"],
        amount = doc.data()!["amount"],
        address = doc.data()!["address"],
        sale = doc.data()!["sale"],
        phoneNumber = doc.data()!["phoneNumber"],
        total = doc.data()!["total"],
        originalPrice = doc.data()!["originalPrice"];
}
