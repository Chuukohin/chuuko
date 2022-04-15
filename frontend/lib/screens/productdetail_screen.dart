import 'package:chuukohin/widgets/button.dart';
import 'package:flutter/material.dart';

import '../widgets/layout/product_detail.dart';

class Productdetail_screen extends StatelessWidget {
  const Productdetail_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 858,
      width: 421,
      color: Colors.white,
      child: Column(
        children: [
          Container(
            color: Color(0xffB89476),
            height: 207,
            width: 343,
            margin: EdgeInsets.only(top: 15, bottom: 14),
          ),
          Product_Detail("Product name", "uniqol", "Shrit", "Bangkok", 5000,
              "white shirt sdcsdcdscvdsvdsvcvdscfedewdewfewfewfewfewf"),
          Padding(
            padding: const EdgeInsets.only(bottom: 60, left: 41, top: 229),
            child: Row(
              children: [
                Container(
                  height: 48,
                  width: 158,
                  margin: EdgeInsets.only(right: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(39)),
                      color: Colors.white,
                      border: Border.all(width: 1, color: Color(0xffB89476))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.favorite_outline,
                        color: Color(0xffB89476),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          "Favorite",
                          style: const TextStyle(
                            fontSize: 17,
                            color: Color(0xffB89476),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                MainButton("Add To Cart", 48, 158),
              ],
            ),
          )
        ],
      ),
    );
  }
}
