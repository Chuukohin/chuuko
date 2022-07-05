import 'package:chuukohin/constant/environment.dart';
import 'package:chuukohin/constant/theme.dart';
import 'package:chuukohin/models/response/error/error_response.dart';
import 'package:chuukohin/screens/core/payment/payment_successful.dart';
import 'package:chuukohin/services/order.dart';
import 'package:chuukohin/services/provider/provider.dart';
import 'package:chuukohin/widgets/order/order_text_span.dart';
import 'package:flutter/material.dart';
import 'package:niku/namespace.dart' as n;
import 'package:provider/provider.dart';

class CheckoutScreen extends StatefulWidget {
  final String pictureUrl;
  final String name;
  final String brand;
  final int price;
  final int productId;
  const CheckoutScreen(
      {Key? key,
      required this.pictureUrl,
      required this.name,
      required this.brand,
      required this.price,
      required this.productId})
      : super(key: key);

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
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset:
                            const Offset(1, 1), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: n.Row(
                      [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            widget.pictureUrl.contains('https')
                                ? widget.pictureUrl
                                : EnvironmentConstant.internalPrefix +
                                    widget.pictureUrl,
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          width: screenWidth / 1.8,
                          margin: const EdgeInsets.only(left: 12),
                          height: 70,
                          child: n.Column(
                            [
                              n.Text(widget.name)
                                ..fontWeight = FontWeight.w600
                                ..fontSize = 16
                                ..overflow = TextOverflow.ellipsis,
                              n.Text(widget.brand)
                                ..fontSize = 13
                                ..color = ThemeConstant.orderTextColor,
                              n.Text(widget.price.toString() + "฿")
                                ..color = ThemeConstant.primaryColor,
                            ],
                          )
                            ..crossAxisAlignment = CrossAxisAlignment.start
                            ..mainAxisAlignment =
                                MainAxisAlignment.spaceBetween,
                        ),
                      ],
                    )..crossAxisAlignment = CrossAxisAlignment.center,
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
                        offset:
                            const Offset(1, 1), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Column(
                      children: [
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
                            [
                              OrderTextSpan(
                                  title: "Name",
                                  text: Provider.of<ProfileProvider>(context,
                                          listen: false)
                                      .addressInfo
                                      .name),
                              OrderTextSpan(
                                  title: "Phone No",
                                  text: Provider.of<ProfileProvider>(context,
                                          listen: false)
                                      .addressInfo
                                      .phone),
                              OrderTextSpan(
                                  title: "Address",
                                  text: Provider.of<ProfileProvider>(context,
                                              listen: false)
                                          .addressInfo
                                          .addressLine1 +
                                      Provider.of<ProfileProvider>(context,
                                              listen: false)
                                          .addressInfo
                                          .addressLine2),
                              OrderTextSpan(
                                  title: "Sub-District",
                                  text: Provider.of<ProfileProvider>(context,
                                          listen: false)
                                      .addressInfo
                                      .subDistrict),
                              OrderTextSpan(
                                  title: "District",
                                  text: Provider.of<ProfileProvider>(context,
                                          listen: false)
                                      .addressInfo
                                      .district),
                              OrderTextSpan(
                                  title: "Province",
                                  text: Provider.of<ProfileProvider>(context,
                                          listen: false)
                                      .addressInfo
                                      .province),
                              OrderTextSpan(
                                  title: "Postal Code",
                                  text: Provider.of<ProfileProvider>(context,
                                          listen: false)
                                      .addressInfo
                                      .postalCode),
                            ],
                          )
                            ..crossAxisAlignment = CrossAxisAlignment.start
                            ..mainAxisAlignment =
                                MainAxisAlignment.spaceBetween,
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
                        offset:
                            const Offset(1, 1), // changes position of shadow
                      ),
                    ],
                  ),
                  width: double.infinity,
                  height: 85,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 16),
                    child: n.Column(
                      [
                        n.Row([
                          n.Text("Delivery Fee")
                            ..color = ThemeConstant.secondaryColor
                            ..fontWeight = FontWeight.w500
                            ..fontSize = 16,
                          n.Text("0฿")
                            ..fontSize = 16
                            ..color = ThemeConstant.secondaryColor,
                        ])
                          ..mainAxisAlignment = MainAxisAlignment.spaceBetween,
                        n.Row([
                          n.Text("Total")
                            ..color = ThemeConstant.secondaryColor
                            ..fontWeight = FontWeight.w700
                            ..fontSize = 20,
                          n.Text(widget.price.toString() + "฿")
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
                onPressed: () async {
                  await OrderService.createOrder(widget.productId)
                      .then((response) {
                    if (response is ErrorResponse) {
                      var error = SnackBar(
                        behavior: SnackBarBehavior.floating,
                        margin: const EdgeInsets.only(
                            bottom: 60, left: 15, right: 15),
                        content: Text(response.message),
                        action: SnackBarAction(
                          label: 'OK',
                          onPressed: () {},
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(error);
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PaymentSuccessfulScreen(),
                        ),
                      );
                    }
                  });
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
