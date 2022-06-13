import 'package:chuukohin/constant/theme.dart';
import 'package:chuukohin/types/widget/placement.dart';
import 'package:chuukohin/widgets/typography/header_text.dart';
import 'package:flutter/material.dart';

class ProductDetail extends StatelessWidget {
  final String productname;
  final String brand;
  final String category;
  final String address;
  final int price;
  final String desciption;

  const ProductDetail(this.productname, this.brand, this.category, this.address,
      this.price, this.desciption,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          productname,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: ThemeConstant.secondaryColor,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    brand,
                    style: TextStyle(
                        fontSize: 16,
                        color: ThemeConstant.productTextColor,
                        fontWeight: FontWeight.w600),
                  ),
                  Container(
                      width: 5,
                      height: 5,
                      margin: const EdgeInsets.only(left: 8, right: 8),
                      decoration: BoxDecoration(
                          color: ThemeConstant.productTextColor,
                          shape: BoxShape.circle)),
                  Text(
                    category,
                    style: TextStyle(
                        fontSize: 16,
                        color: ThemeConstant.productTextColor,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              HeaderText(
                text: price.toString() + "฿",
                size: Size.medium,
                color: ThemeConstant.secondaryColor,
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 6),
                child: const Icon(
                  Icons.location_on_rounded,
                  color: Color(0xffDCB9A3),
                  size: 16,
                ),
              ),
              Text(
                address,
                style: const TextStyle(
                    color: Color(0xffDCB9A3),
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
        const Padding(
            padding: EdgeInsets.only(bottom: 3, top: 19),
            child: Text(
              "Decription",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Color(0xFFDCB9A3),
              ),
            )),
        Text(
          desciption,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            color: Color(0xFF9F9884),
          ),
        )
      ]),
    );
  }
}
