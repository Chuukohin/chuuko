import 'package:flutter/material.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Product_Detail extends StatelessWidget {
  final String productname;
  final String brand;
  final String catecory;
  final String address;
  final double price;
  final String desciption;

  const Product_Detail(this.productname, this.brand, this.catecory,
      this.address, this.price, this.desciption,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(left: 47, right: 35),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            productname,
            style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: Color(0xff6C4E37)),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      brand,
                      style: const TextStyle(
                          fontSize: 16,
                          color: Color(0xffDCB9A3),
                          fontWeight: FontWeight.w600),
                    ),
                    Container(
                        width: 6,
                        height: 6,
                        margin: EdgeInsets.only(left: 8, right: 8),
                        decoration: BoxDecoration(
                            color: Color(0xffDCB9A3), shape: BoxShape.circle)),
                    Text(
                      catecory,
                      style: const TextStyle(
                          fontSize: 16,
                          color: Color(0xffDCB9A3),
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                Text(
                  price.toString(),
                  style: TextStyle(
                      color: Color(0xff6C4E37),
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  color: Color(0xffDCB9A3),
                  size: 14,
                ),
                SizedBox(width: 8),
                Text(address,
                    style: const TextStyle(
                        color: Color(0xffDCB9A3),
                        fontSize: 14,
                        fontWeight: FontWeight.w600)),
              ],
            ),
          ),
          Padding(
              padding: EdgeInsets.only(bottom: 3, top: 19),
              child: Text(
                "Decription",
                style: TextStyle(color: Color(0xFFDCB9A3), fontSize: 14),
              )),
          Text(
            desciption,
            style: TextStyle(color: Color(0xFF9F9884), fontSize: 14),
          )
        ]),
      ),
    );
  }
}
