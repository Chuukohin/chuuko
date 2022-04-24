import 'package:flutter/material.dart';

class ProductDetail extends StatelessWidget {
  final String productname;
  final String brand;
  final String category;
  final String address;
  final double price;
  final String desciption;

  const ProductDetail(this.productname, this.brand, this.category, this.address,
      this.price, this.desciption,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(left: 47, right: 35),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          // ImageSlideshow(
          //   width: 343,
          //   height: 207,
          //   indicatorColor: Colors.white,
          //   indicatorBackgroundColor: Color(0xffE8CEBD),
          //   children:
          //       Image.asset('frontend/images/shirt.jpeg', fit: BoxFit.cover),
          // ),
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
                        margin: const EdgeInsets.only(left: 8, right: 8),
                        decoration: const BoxDecoration(
                            color: Color(0xffDCB9A3), shape: BoxShape.circle)),
                    Text(
                      category,
                      style: const TextStyle(
                          fontSize: 16,
                          color: Color(0xffDCB9A3),
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                Text(
                  price.toString(),
                  style: const TextStyle(
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
                const Icon(
                  Icons.location_on_outlined,
                  color: Color(0xffDCB9A3),
                  size: 14,
                ),
                const SizedBox(width: 8),
                Text(address,
                    style: const TextStyle(
                        color: Color(0xffDCB9A3),
                        fontSize: 14,
                        fontWeight: FontWeight.w600)),
              ],
            ),
          ),
          const Padding(
              padding: EdgeInsets.only(bottom: 3, top: 19),
              child: Text(
                "Decription",
                style: TextStyle(color: Color(0xFFDCB9A3), fontSize: 14),
              )),
          Text(
            desciption,
            style: const TextStyle(color: Color(0xFF9F9884), fontSize: 14),
          )
        ]),
      ),
    );
  }
}
