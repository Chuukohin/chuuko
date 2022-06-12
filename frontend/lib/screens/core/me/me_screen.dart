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
    {"name": "My Profile", "path": "/profile"},
    {"name": "Order Status", "path": "/"},
    {"name": "My Address", "path": "/"},
    {"name": "My Card", "path": "/"},
  ];
  final List<Map<String, dynamic>> sellerDetail = [
    {"name": "My Shop", "path": "/profile/shop"},
    {"name": "Your Product / Management", "path": "/"},
    {"name": "Order Report", "path": "/"},
    {"name": "Income", "path": "/"},
  ];

  final String userType = 'seller';
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: n.Column(
            [
              Container(
                margin: const EdgeInsets.only(bottom: 24),
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/images/shop-bg.png',
                      height: 180,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      color: Colors.white.withOpacity(0.4),
                      colorBlendMode: BlendMode.modulate,
                    ),
                    Container(
                      padding:
                          const EdgeInsets.only(top: 70, left: 30, right: 30),
                      child: n.Row(
                        [
                          Container(
                            margin: const EdgeInsets.only(right: 20),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(120),
                              child: Image.network(
                                'https://cdn.discordapp.com/attachments/749662268576497855/985587737866432594/8FDC299C-4D29-4D66-BFD9-DE106D0E9967.jpg',
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
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: n.Column([
                  Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      child: n.Text("My Account")
                        ..fontWeight = FontWeight.bold),
                  Container(
                    margin: const EdgeInsets.only(bottom: 24),
                    width: double.infinity,
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
                    child: n.Column(
                      dividerInsert(
                        accountDetail
                            .mapIndexed(
                              (index, element) => Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 12),
                                child: GestureDetector(
                                  onTap: () => Navigator.pushNamed(
                                      context, element['path']),
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
                                    color: Colors.grey.withOpacity(0.3),
                                    spreadRadius: 1,
                                    blurRadius: 2,
                                    offset: const Offset(
                                        1, 1), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: n.Column(
                                dividerInsert(
                                  sellerDetail
                                      .mapIndexed(
                                        (index, element) => Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16, vertical: 12),
                                          child: GestureDetector(
                                            onTap: () => Navigator.pushNamed(
                                                context, element['path']),
                                            behavior:
                                                HitTestBehavior.translucent,
                                            child: n.Row(
                                              [
                                                n.Text(element['name'])
                                                  ..fontSize = 12
                                                  ..fontWeight =
                                                      FontWeight.w500,
                                                Icon(
                                                  Icons
                                                      .arrow_forward_ios_rounded,
                                                  size: 14,
                                                  color: ThemeConstant
                                                      .dividerColor,
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
                                    color: Colors.grey.withOpacity(0.3),
                                    spreadRadius: 1,
                                    blurRadius: 2,
                                    offset: const Offset(1, 1),
                                  ),
                                ],
                              ),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 14),
                                child: GestureDetector(
                                  onTap: () => Navigator.pushNamed(
                                      context, '/seller/signup'),
                                  behavior: HitTestBehavior.translucent,
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
                                    ..crossAxisAlignment =
                                        CrossAxisAlignment.center,
                                ),
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
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
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
                  ),
                ])
                  ..crossAxisAlignment = CrossAxisAlignment.start,
              )
            ],
          )..crossAxisAlignment = CrossAxisAlignment.start,
        ),
      ),
    );
  }
}
