import 'package:chuukohin/constant/color.dart';
import 'package:chuukohin/screens/core/homepage_screen.dart';
import 'package:flutter/material.dart';
import 'package:niku/namespace.dart' as n;

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(top: screenHeight / 7, bottom: 50),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Image.asset(
                      "assets/images/welcome.png",
                      width: 500,
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                      child: n.Text("Place to sell your clothes")
                        ..textAlign = TextAlign.center
                        ..fontSize = 34
                        ..color = ThemeConstant.secondaryColor
                        ..fontWeight = FontWeight.w700,
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                      child: n.Text(
                          "Easy and convenience place to sell your second-hand clothes")
                        ..fontWeight = FontWeight.w400
                        ..color = const Color(0xff9F9884)
                        ..textAlign = TextAlign.center,
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.only(left: 35, right: 35),
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    child: n.Text("Get Started")..fontSize = 16,
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomepageScreen(),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
