import 'package:flutter/material.dart';
import 'package:niku/namespace.dart' as n;

class ProductCard extends StatelessWidget {
  final String productname;
  final String brand;
  final int price;
  final String image;

  const ProductCard(this.productname, this.brand, this.price, this.image,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      height: 220,
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xff000000).withOpacity(0.25),
            blurRadius: 4,
            offset: const Offset(
              0,
              1,
            ),
          )
        ],
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            ),
            child: Image.asset(
              image,
              width: double.infinity,
              height: 170,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 8),
            padding: const EdgeInsets.only(right: 10, left: 10),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 2),
                        child: n.Text(productname)
                          ..color = const Color(0xff434343)
                          ..fontWeight = FontWeight.w500
                          ..fontSize = 13,
                      ),
                      n.Text(brand)
                        ..color = const Color(0xffC4C4C4)
                        ..fontSize = 12
                    ],
                  ),
                  n.Text(price.toString() + "฿")
                    ..color = const Color(0xff434343)
                    ..fontWeight = FontWeight.w700,
                ]),
          ),
        ],
      ),
    );
  }
}
