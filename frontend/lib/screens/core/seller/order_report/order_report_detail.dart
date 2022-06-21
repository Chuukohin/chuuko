import 'package:chuukohin/constant/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:niku/namespace.dart' as n;

class OrderReportDetail extends StatefulWidget {
  const OrderReportDetail({Key? key}) : super(key: key);

  @override
  State<OrderReportDetail> createState() => _OrderReportDetailState();
}

class _OrderReportDetailState extends State<OrderReportDetail> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: 120,
      margin: const EdgeInsets.only(bottom: 16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(1, 1), // changes position of shadow
          ),
        ],
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
        child: n.Row(
          [
            n.Row(
              [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    'https://cdn.discordapp.com/attachments/749662268576497855/985587737866432594/8FDC299C-4D29-4D66-BFD9-DE106D0E9967.jpg',
                    height: 100,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 12),
                  height: 70,
                  width: screenWidth / 1.9,
                  child: n.Column(
                    [
                      n.Text("Sangonomiya Kokomi Kokomi")
                        ..fontWeight = FontWeight.w600
                        ..fontSize = 16
                        ..overflow = TextOverflow.ellipsis,
                      n.Text("Order ID: ck2000100034")
                        ..fontSize = 13
                        ..color = ThemeConstant.orderTextColor,
                      n.Text("Order Time: 14/03/2022 21:19")
                        ..color = ThemeConstant.orderTextColor
                        ..fontSize = 13
                    ],
                  )
                    ..crossAxisAlignment = CrossAxisAlignment.start
                    ..mainAxisAlignment = MainAxisAlignment.spaceBetween,
                ),
              ],
            ),
            Icon(
              CupertinoIcons.chevron_forward,
              color: ThemeConstant.orderTextColor,
            ),
          ],
        )..mainAxisAlignment = MainAxisAlignment.spaceBetween,
      ),
    );
  }
}
