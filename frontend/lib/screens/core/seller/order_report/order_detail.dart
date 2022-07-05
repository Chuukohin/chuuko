import 'package:chuukohin/constant/theme.dart';
import 'package:chuukohin/services/provider/provider.dart';
import 'package:chuukohin/widgets/order/order_text_span.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:niku/namespace.dart' as n;
import 'package:provider/provider.dart';

class OrderDetail extends StatefulWidget {
  const OrderDetail({Key? key}) : super(key: key);

  @override
  State<OrderDetail> createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {
  final int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: n.Text('Order Detail'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 8, left: 12, right: 12, bottom: 30),
        child: n.Column(
          [
            Container(
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
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: n.Row(
                  [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        Provider.of<ProfileProvider>(context, listen: false)
                            .orderDetail
                            .product
                            .pictureUrl,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      width: screenWidth / 1.7,
                      margin: const EdgeInsets.only(left: 12),
                      height: 70,
                      child: n.Column(
                        [
                          n.Text(Provider.of<ProfileProvider>(context,
                                  listen: false)
                              .orderDetail
                              .product
                              .name)
                            ..fontWeight = FontWeight.w600
                            ..fontSize = 16
                            ..overflow = TextOverflow.ellipsis,
                          n.Text(Provider.of<ProfileProvider>(context,
                                  listen: false)
                              .orderDetail
                              .product
                              .brand)
                            ..fontSize = 13
                            ..color = ThemeConstant.orderTextColor,
                          n.Text(Provider.of<ProfileProvider>(context,
                                      listen: false)
                                  .orderDetail
                                  .product
                                  .price
                                  .toString() +
                              "฿")
                            ..color = ThemeConstant.primaryColor,
                        ],
                      )
                        ..crossAxisAlignment = CrossAxisAlignment.start
                        ..mainAxisAlignment = MainAxisAlignment.spaceBetween,
                    ),
                  ],
                )..crossAxisAlignment = CrossAxisAlignment.center,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 16),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      child: n.Text("Order Information")
                        ..fontWeight = FontWeight.w700
                        ..fontSize = 16,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 100,
                      child: n.Column(
                        [
                          OrderTextSpan(
                              title: "Customer",
                              text: Provider.of<ProfileProvider>(context,
                                      listen: false)
                                  .orderDetail
                                  .orderDetail
                                  .customerName),
                          OrderTextSpan(
                              title: "Order ID",
                              text: Provider.of<ProfileProvider>(context,
                                      listen: false)
                                  .orderDetail
                                  .orderDetail
                                  .orderId
                                  .toString()),
                          OrderTextSpan(
                            title: "Order Time",
                            text: DateFormat("dd/mm/yyyy H:m").format(
                              DateTime.parse(Provider.of<ProfileProvider>(
                                      context,
                                      listen: false)
                                  .orderDetail
                                  .orderDetail
                                  .orderTime),
                            ),
                          ),
                          OrderTextSpan(
                              title: "Total",
                              text: Provider.of<ProfileProvider>(context,
                                          listen: false)
                                      .orderDetail
                                      .orderDetail
                                      .price
                                      .toString() +
                                  "฿"),
                        ],
                      )
                        ..crossAxisAlignment = CrossAxisAlignment.start
                        ..mainAxisAlignment = MainAxisAlignment.spaceBetween,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 16),
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      child: n.Text("Address")
                        ..fontWeight = FontWeight.w700
                        ..fontSize = 16,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 210,
                      child: n.Column(
                        [
                          OrderTextSpan(
                              title: "Name",
                              text: Provider.of<ProfileProvider>(context,
                                      listen: false)
                                  .orderDetail
                                  .address
                                  .name),
                          OrderTextSpan(
                              title: "Phone No",
                              text: Provider.of<ProfileProvider>(context,
                                      listen: false)
                                  .orderDetail
                                  .address
                                  .phone),
                          OrderTextSpan(
                              title: "Address",
                              text: Provider.of<ProfileProvider>(context,
                                          listen: false)
                                      .orderDetail
                                      .address
                                      .addressLine1 +
                                  Provider.of<ProfileProvider>(context,
                                          listen: false)
                                      .orderDetail
                                      .address
                                      .addressLine2),
                          OrderTextSpan(
                              title: "Sub-District",
                              text: Provider.of<ProfileProvider>(context,
                                      listen: false)
                                  .orderDetail
                                  .address
                                  .subDistrict),
                          OrderTextSpan(
                              title: "District",
                              text: Provider.of<ProfileProvider>(context,
                                      listen: false)
                                  .orderDetail
                                  .address
                                  .district),
                          OrderTextSpan(
                              title: "Province",
                              text: Provider.of<ProfileProvider>(context,
                                      listen: false)
                                  .orderDetail
                                  .address
                                  .province),
                          OrderTextSpan(
                              title: "Postal Code",
                              text: Provider.of<ProfileProvider>(context,
                                      listen: false)
                                  .orderDetail
                                  .address
                                  .postalCode),
                        ],
                      )
                        ..crossAxisAlignment = CrossAxisAlignment.start
                        ..mainAxisAlignment = MainAxisAlignment.spaceBetween,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 16),
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      child: n.Text("Delivery Information")
                        ..fontWeight = FontWeight.w700
                        ..fontSize = 16,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 45,
                      child: n.Column(
                        [
                          const OrderTextSpan(
                              title: "Delivery By", text: "Chuukohin Delivery"),
                          OrderTextSpan(
                              title: "Tracking Number",
                              text: Provider.of<ProfileProvider>(context,
                                      listen: false)
                                  .orderDetail
                                  .deliveryInfo
                                  .trackingNumber),
                        ],
                      )
                        ..crossAxisAlignment = CrossAxisAlignment.start
                        ..mainAxisAlignment = MainAxisAlignment.spaceBetween,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 16),
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
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      child: n.Text("Track Order")
                        ..fontWeight = FontWeight.w700
                        ..fontSize = 16,
                    ),
                    Stepper(
                      controlsBuilder: (context, _) {
                        return Container();
                      },
                      physics: const ScrollPhysics(),
                      currentStep: _currentStep,
                      steps: [
                        Step(
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(bottom: 4),
                                child: n.Text("Sender received the product"),
                              ),
                              n.Text("1 June 2022 14:00"),
                            ],
                          ),
                          content: Container(),
                        ),
                        Step(
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(bottom: 4),
                                child: n.Text("Delivering"),
                              ),
                              n.Text("2 June 2022 10:50"),
                            ],
                          ),
                          content: Container(),
                        ),
                        Step(
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(bottom: 4),
                                child: n.Text("Customer received"),
                              ),
                              n.Text("2 June 2022 11:43"),
                            ],
                          ),
                          content: Container(),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
