import 'package:chuukohin/constant/theme.dart';
import 'package:chuukohin/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:niku/namespace.dart' as n;

class PaymentSuccessfulScreen extends StatelessWidget {
  const PaymentSuccessfulScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Container(
          width: double.infinity,
          padding: EdgeInsets.only(
              top: screenHeight / 6.5, left: 20, right: 12, bottom: 40),
          child: n.Column(
            [
              n.Column([
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: Image.asset(
                    'assets/images/payment-success.png',
                    width: 300,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 14),
                  child: n.Text("Payment Successful")
                    ..fontSize = 34
                    ..fontWeight = FontWeight.bold
                    ..color = ThemeConstant.secondaryColor
                    ..textAlign = TextAlign.center,
                ),
                n.Text("Thank you for ordering with us")
                  ..color = const Color(0xff9F9884)
              ]),
              const MainButton("Back To Home", 50, 300, '/home')
            ],
          )..mainAxisAlignment = MainAxisAlignment.spaceBetween,
        ),
      ),
    );
  }
}
