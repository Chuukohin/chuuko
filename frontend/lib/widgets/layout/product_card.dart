import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String productname;
  final String band;
  final double price;
  final String image;

  const ProductCard(this.productname, this.band, this.price, this.image,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      height: 209,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          //background color of box
          BoxShadow(
            color: const Color(0xff000000).withOpacity(0.25),

            blurRadius: 4, // soften the shadow
            //extend the shadow
            offset: const Offset(
              0, // Move to right 10  horizontally
              1, // Move to bottom 10 Vertically
            ),
          )
        ],
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 164,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 7, left: 10),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productname,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xff434343),
                        ),
                      ),
                      Text(
                        band,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xffC4C4C4),
                        ),
                      )
                    ],
                  ),
                  Text(
                    price.toString(),
                    style: const TextStyle(
                        fontSize: 14,
                        color: Color(0xff434343),
                        fontWeight: FontWeight.bold),
                  )
                ]),
          ),
        ],
      ),
    );
  }
}
