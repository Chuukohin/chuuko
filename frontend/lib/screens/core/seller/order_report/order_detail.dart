import 'package:chuukohin/constant/theme.dart';
import 'package:chuukohin/widgets/order/order_text_span.dart';
import 'package:flutter/material.dart';
import 'package:niku/namespace.dart' as n;

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
        padding:
            const EdgeInsets.only(top: 12, left: 12, right: 12, bottom: 30),
        child: n.Column(
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
                  width: screenWidth / 1.7,
                  margin: const EdgeInsets.only(left: 12),
                  height: 90,
                  child: n.Column(
                    [
                      n.Text("Sangonomiya Kokomi Shirt ss")
                        ..fontWeight = FontWeight.w600
                        ..fontSize = 16
                        ..overflow = TextOverflow.ellipsis,
                      n.Text("The dress than fanlniea feaijiojdifj mkmkamfe.")
                        ..fontSize = 13
                        ..color = ThemeConstant.orderTextColor,
                      n.Text("98฿")..color = ThemeConstant.primaryColor,
                    ],
                  )
                    ..crossAxisAlignment = CrossAxisAlignment.start
                    ..mainAxisAlignment = MainAxisAlignment.spaceBetween,
                ),
              ],
            )..crossAxisAlignment = CrossAxisAlignment.center,
            Divider(
              color: ThemeConstant.dividerColor,
              thickness: 1,
              height: 30,
              indent: 10,
              endIndent: 10,
            ),
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
                const [
                  OrderTextSpan(title: "Customer", text: "Sangonomiya Kokomi"),
                  OrderTextSpan(title: "Order ID", text: "ck200001000034"),
                  OrderTextSpan(title: "Order Time", text: "14/03/2022 21:19"),
                  OrderTextSpan(title: "Total", text: "1049฿"),
                ],
              )
                ..crossAxisAlignment = CrossAxisAlignment.start
                ..mainAxisAlignment = MainAxisAlignment.spaceBetween,
            ),
            Divider(
              color: ThemeConstant.dividerColor,
              thickness: 1,
              height: 30,
              indent: 10,
              endIndent: 10,
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 12),
              child: n.Text("Address")
                ..fontWeight = FontWeight.w700
                ..fontSize = 16,
            ),
            SizedBox(
              width: double.infinity,
              height: 220,
              child: n.Column(
                const [
                  OrderTextSpan(title: "Name", text: "Sangonomiya Kokomi"),
                  OrderTextSpan(title: "Phone No", text: "099-999-9999"),
                  OrderTextSpan(title: "Detail", text: "some text"),
                  OrderTextSpan(title: "Sub-District", text: "some text"),
                  OrderTextSpan(title: "District", text: "some text"),
                  OrderTextSpan(title: "Province", text: "some text"),
                  OrderTextSpan(title: "Postal Code", text: "some text"),
                  OrderTextSpan(title: "Description", text: "some text"),
                ],
              )
                ..crossAxisAlignment = CrossAxisAlignment.start
                ..mainAxisAlignment = MainAxisAlignment.spaceBetween,
            ),
            Divider(
              color: ThemeConstant.dividerColor,
              thickness: 1,
              height: 30,
              indent: 10,
              endIndent: 10,
            ),
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
                const [
                  OrderTextSpan(
                      title: "Delivery By", text: "Chuukohin Delivery"),
                  OrderTextSpan(
                      title: "Tracking Number", text: "CKH1220056667"),
                ],
              )
                ..crossAxisAlignment = CrossAxisAlignment.start
                ..mainAxisAlignment = MainAxisAlignment.spaceBetween,
            ),
            Divider(
              color: ThemeConstant.dividerColor,
              thickness: 1,
              height: 40,
              indent: 10,
              endIndent: 10,
            ),
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
    );
  }
}
