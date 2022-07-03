import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget items({
  required Image imagesitem,
  required String nameitem,
  required String unit,
  required int priceitem,
}) {
  return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: const Color(0xFFE1E1E1),
          )),
      height: 248.51,
      width: 173.32,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
        child: Column(
          children: [
            SizedBox(
              height: 80,
              child: imagesitem,
            ),
            const Padding(padding: EdgeInsets.only(bottom: 10)),
            Text(
              (nameitem),
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Gilroy"),
            ),
            const Padding(padding: EdgeInsets.only(bottom: 5)),
            Text(unit,
                style: const TextStyle(fontSize: 14, fontFamily: "Gilroyl")),
            const Padding(padding: EdgeInsets.only(bottom: 20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("\$$priceitem",
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Gilroy")),
                Image.asset("asset/images/cong.png"),
              ],
            ),
          ],
        ),
      ));
}
