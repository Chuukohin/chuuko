import 'package:chuukohin/constant/theme.dart';
import 'package:chuukohin/screens/core/payment/payment_successful.dart';
import 'package:chuukohin/widgets/order/order_text_span.dart';
import 'package:flutter/material.dart';
import 'package:niku/namespace.dart' as n;

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: n.Text('Check Out'),
      ),
      body: Container(
        padding:
            const EdgeInsets.only(top: 12, left: 12, right: 12, bottom: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            n.Column(
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
                          n.Text(
                              "The dress than fanlniea feaijiojdifj mkmkamfe.")
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
                  child: n.Text("Your Address")
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
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: n.Column(
                    [
                      n.Row([
                        n.Text("Delivery Fee")
                          ..color = ThemeConstant.secondaryColor
                          ..fontWeight = FontWeight.w500
                          ..fontSize = 16,
                        n.Text("20฿")
                          ..fontSize = 16
                          ..color = ThemeConstant.secondaryColor,
                      ])
                        ..mainAxisAlignment = MainAxisAlignment.spaceBetween,
                      n.Row([
                        n.Text("Total")
                          ..color = ThemeConstant.secondaryColor
                          ..fontWeight = FontWeight.w700
                          ..fontSize = 20,
                        n.Text("20฿")
                          ..color = ThemeConstant.secondaryColor
                          ..fontWeight = FontWeight.w700
                          ..fontSize = 20,
                      ])
                        ..mainAxisAlignment = MainAxisAlignment.spaceBetween,
                    ],
                  )
                    ..crossAxisAlignment = CrossAxisAlignment.start
                    ..mainAxisAlignment = MainAxisAlignment.spaceBetween,
                ),
              ],
            ),
            SizedBox(
              width: 300,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PaymentSuccessfulScreen(),
                    ),
                  );
                },
                child: const Text(
                  "Pay now",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
