import 'dart:developer';

import 'package:chuukohin/constant/theme.dart';
import 'package:chuukohin/models/response/me/my_shop/my_shop_response.dart';
import 'package:chuukohin/screens/core/product/product_detail_screen.dart';
import 'package:chuukohin/services/me/myshop.dart';
import 'package:chuukohin/services/provider/provider.dart';
import 'package:chuukohin/widgets/product/product_card.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:niku/namespace.dart' as n;
import 'package:provider/provider.dart';

class MyShopScreen extends StatefulWidget {
  const MyShopScreen({Key? key}) : super(key: key);

  @override
  State<MyShopScreen> createState() => _MyShopScreenState();
}

class _MyShopScreenState extends State<MyShopScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: n.Text('My shop'),
        ),
        body: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Image.asset(
                            'assets/images/shop-bg.png',
                            height: 140,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            color: Colors.white.withOpacity(0.4),
                            colorBlendMode: BlendMode.modulate,
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                                top: 30, left: 30, right: 30),
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
                                SizedBox(
                                  height: 60,
                                  child: n.Column([
                                    SizedBox(
                                      width: screenWidth * 0.5,
                                      child: n.Text(Provider.of<SellerProvider>(
                                              context,
                                              listen: false)
                                          .shopData
                                          .seller
                                          .name)
                                        ..fontWeight = FontWeight.bold
                                        ..fontSize = 16
                                        ..color = ThemeConstant.profileTextColor
                                        ..overflow = TextOverflow.ellipsis,
                                    ),
                                    n.Text(
                                      "Joined date: " +
                                          DateFormat("dd/MM/yyyy").format(
                                            DateTime.parse(
                                                Provider.of<SellerProvider>(
                                                        context,
                                                        listen: false)
                                                    .shopData
                                                    .seller
                                                    .joinDate),
                                          ),
                                    )
                                      ..fontSize = 13
                                      ..fontWeight = FontWeight.w300,
                                    n.Text("Products: " +
                                        Provider.of<SellerProvider>(context,
                                                listen: false)
                                            .shopData
                                            .products
                                            .length
                                            .toString())
                                      ..fontSize = 13
                                      ..fontWeight = FontWeight.w300,
                                  ])
                                    ..mainAxisAlignment =
                                        MainAxisAlignment.spaceBetween
                                    ..crossAxisAlignment =
                                        CrossAxisAlignment.start,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          margin: const EdgeInsets.only(bottom: 16, top: 20),
                          child: n.Text("All Products")
                            ..fontWeight = FontWeight.bold),
                    ],
                  ),
                ],
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.only(left: 12, right: 12, bottom: 30),
              sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: screenHeight / 1100,
                  crossAxisSpacing: 10.0,
                ),
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ProductDetailScreen(),
                          ),
                        );
                      },
                      child: const ProductCard(
                          "T-Shirt", "Uniqlo", 100, 'assets/images/shirt.png'),
                    );
                  },
                  childCount: 10,
                ),
              ),
            ),
          ],
        ));
  }
}
