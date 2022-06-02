import 'package:chuukohin/widgets/product_detail.dart';

import 'package:chuukohin/widgets/button.dart';

import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 858,
      width: 421,
      color: Colors.white,
      child: Column(
        children: [
          Container(
            color: const Color(0xffB89476),
            height: 207,
            width: 343,
            margin: const EdgeInsets.only(top: 15, bottom: 14),
          ),
          const ProductDetail("Product name", "uniqol", "Shrit", "Bangkok",
              5000, "white shirt sdcsdcdscvdsvdsvcvdscfedewdewfewfewfewfewf"),
          Padding(
            padding: const EdgeInsets.only(bottom: 60, left: 41, top: 229),
            child: Row(
              children: [
                Container(
                  height: 48,
                  width: 158,
                  margin: const EdgeInsets.only(right: 20),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(39)),
                      color: Colors.white,
                      border:
                          Border.all(width: 1, color: const Color(0xffB89476))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.favorite_outline,
                        color: Color(0xffB89476),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          "Favorite",
                          style: TextStyle(
                            fontSize: 17,
                            color: Color(0xffB89476),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const MainButton("Add To Cart", 48, 158),
              ],
            ),
          )
        ],
      ),
    );
  }
}
