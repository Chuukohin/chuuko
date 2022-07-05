import 'package:chuukohin/constant/environment.dart';
import 'package:chuukohin/constant/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:niku/namespace.dart' as n;

class OrderReportDetail extends StatefulWidget {
  final String productName;
  final String orderId;
  final String orderTime;
  final String productPicture;
  const OrderReportDetail(
      {Key? key,
      required this.productName,
      required this.orderId,
      required this.orderTime,
      required this.productPicture})
      : super(key: key);

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
                    widget.productPicture.contains('https')
                        ? widget.productPicture
                        : EnvironmentConstant.internalPrefix +
                            widget.productPicture,
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 12),
                  height: 70,
                  width: screenWidth / 1.9,
                  child: n.Column(
                    [
                      n.Text(widget.productName)
                        ..fontWeight = FontWeight.w600
                        ..fontSize = 16
                        ..overflow = TextOverflow.ellipsis,
                      n.Text("Order ID: " + widget.orderId)
                        ..fontSize = 13
                        ..color = ThemeConstant.orderTextColor,
                      n.Text(
                        "Order Time: " +
                            DateFormat("dd/MM/yyyy H:m").format(
                              DateTime.parse(widget.orderTime),
                            ),
                      )
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
