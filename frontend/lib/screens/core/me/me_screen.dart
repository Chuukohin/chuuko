import 'package:chuukohin/constant/theme.dart';
import 'package:chuukohin/screens/start/login_screen.dart';
import 'package:chuukohin/utils/widget/divider_insert.dart';
import 'package:flutter/material.dart';
import 'package:niku/namespace.dart' as n;
import 'package:collection/collection.dart';

class MeScreen extends StatefulWidget {
  const MeScreen({Key? key}) : super(key: key);

  @override
  State<MeScreen> createState() => _MeScreenState();
}

class _MeScreenState extends State<MeScreen> {
  final List<Map<String, dynamic>> accountDetail = [
    {"name": "My Profile", "path": "/myprofile"},
    {"name": "Order Status", "path": "/"},
    {"name": "My Address", "path": "/"},
    {"name": "Payment Method", "path": "/"},
  ];
  final List seller = [
    "My Shop",
    "Your Product / Management",
    "Order Report",
    "Income"
  ];
  final String userType = 'seller';
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.only(top: 60, left: 30, right: 30),
          child: n.Column(
            [
              Container(
                margin: const EdgeInsets.only(bottom: 24),
                child: n.Row(
                  [
                    Container(
                      margin: const EdgeInsets.only(right: 20),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(120),
                        child: Image.network(
                          'https://www.pcgamesn.com/wp-content/uploads/2021/07/genshin-impact-kokomi-release-date.jpg',
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    n.Column([
                      Container(
                        width: screenWidth * 0.5,
                        margin: const EdgeInsets.only(bottom: 4),
                        child: n.Text("Sangonomiya Kokomi")
                          ..fontWeight = FontWeight.bold
                          ..color = ThemeConstant.secondaryColor
                          ..overflow = TextOverflow.ellipsis,
                      ),
                      n.Text("Joined: 11/6/2022"),
                    ])
                      ..crossAxisAlignment = CrossAxisAlignment.start
                  ],
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  child: n.Text("My Account")..fontWeight = FontWeight.bold),
              Container(
                margin: const EdgeInsets.only(bottom: 24),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(1, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: n.Column(
                  dividerInsert(
                    accountDetail
                        .mapIndexed(
                          (index, element) => Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 10),
                            child: GestureDetector(
                              onTap: () =>
                                  Navigator.pushNamed(context, element['path']),
                              behavior: HitTestBehavior.translucent,
                              child: n.Row(
                                [
                                  n.Text(element['name'])
                                    ..fontSize = 12
                                    ..fontWeight = FontWeight.w500,
                                  Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    size: 14,
                                    color: ThemeConstant.dividerColor,
                                  ),
                                ],
                              )
                                ..mainAxisAlignment =
                                    MainAxisAlignment.spaceBetween
                                ..crossAxisAlignment =
                                    CrossAxisAlignment.center,
                            ),
                          ),
                        )
                        .toList(),
                    Divider(
                      color: ThemeConstant.dividerColor,
                      indent: 16,
                      endIndent: 16,
                      height: 1,
                    ),
                  ),
                )..crossAxisAlignment = CrossAxisAlignment.start,
              ),
              userType == "seller"
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            margin: const EdgeInsets.only(bottom: 16),
                            child: n.Text("Seller Management")
                              ..fontWeight = FontWeight.bold),
                        Container(
                          margin: const EdgeInsets.only(bottom: 24),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 5,
                                offset: const Offset(
                                    1, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: n.Column(
                            dividerInsert(
                              seller
                                  .mapIndexed(
                                    (index, element) => Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16, vertical: 10),
                                      child: n.Row(
                                        [
                                          n.Text(element)
                                            ..fontSize = 12
                                            ..fontWeight = FontWeight.w500,
                                          Icon(
                                            Icons.arrow_forward_ios_rounded,
                                            size: 14,
                                            color: ThemeConstant.dividerColor,
                                          ),
                                        ],
                                      )
                                        ..mainAxisAlignment =
                                            MainAxisAlignment.spaceBetween
                                        ..crossAxisAlignment =
                                            CrossAxisAlignment.center,
                                    ),
                                  )
                                  .toList(),
                              Divider(
                                color: ThemeConstant.dividerColor,
                                indent: 16,
                                endIndent: 16,
                                height: 1,
                              ),
                            ),
                          )..crossAxisAlignment = CrossAxisAlignment.start,
                        ),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            margin: const EdgeInsets.only(bottom: 16),
                            child: n.Text("Become a Seller")
                              ..fontWeight = FontWeight.bold),
                        Container(
                          margin: const EdgeInsets.only(bottom: 24),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 5,
                                offset: const Offset(
                                    1, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 14),
                            child: n.Row(
                              [
                                n.Text("Register")
                                  ..fontSize = 12
                                  ..fontWeight = FontWeight.w500,
                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  size: 14,
                                  color: ThemeConstant.dividerColor,
                                ),
                              ],
                            )
                              ..mainAxisAlignment =
                                  MainAxisAlignment.spaceBetween
                              ..crossAxisAlignment = CrossAxisAlignment.center,
                          ),
                        ),
                      ],
                    ),
              Container(
                margin: const EdgeInsets.only(top: 4),
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                    child: const Text("Sign Out"),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        ThemeConstant.logOutBtnColor,
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    }),
              )
            ],
          )..crossAxisAlignment = CrossAxisAlignment.start,
        ),
      ),
    );
  }
}
