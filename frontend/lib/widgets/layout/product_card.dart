import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProductCard extends StatelessWidget {
  String productname;
  String band;
  double price;
  String image;

  ProductCard(this.productname, this.band, this.price, this.image);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      height: 209,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          //background color of box
          BoxShadow(
            color: Color(0xff000000).withOpacity(0.25),

            blurRadius: 4, // soften the shadow
            //extend the shadow
            offset: Offset(
              0, // Move to right 10  horizontally
              1, // Move to bottom 10 Vertically
            ),
          )
        ],
      ),
      child: Column(
        children: [
          //Image.asset(
          //  image,
          //  height: 164,
          //  width: 170,
          // ),
          SizedBox(height: 164),
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
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xff434343),
                        ),
                      ),
                      Text(
                        band,
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xffC4C4C4),
                        ),
                      )
                    ],
                  ),
                  Text(
                    '${NumberFormat("#,###").format(price)}',
                    style: TextStyle(
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
