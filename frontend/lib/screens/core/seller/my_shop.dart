import 'package:chuukohin/constant/theme.dart';
import 'package:chuukohin/screens/core/product/product_detail_screen.dart';
import 'package:chuukohin/widgets/product/product_card.dart';
import 'package:flutter/material.dart';
import 'package:niku/namespace.dart' as n;

class MyShopScreen extends StatefulWidget {
  const MyShopScreen({Key? key}) : super(key: key);

  @override
  State<MyShopScreen> createState() => _MyShopScreenState();
}

class _MyShopScreenState extends State<MyShopScreen> {
  @override
  Widget build(BuildContext context) {
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
                                      'https://www.pcgamesn.com/wp-content/uploads/2021/07/genshin-impact-kokomi-release-date.jpg',
                                      width: 80,
                                      height: 80,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 60,
                                  child: n.Column([
                                    Container(
                                      width: screenWidth * 0.5,
                                      child: n.Text("Chuukohin Shop")
                                        ..fontWeight = FontWeight.bold
                                        ..fontSize = 16
                                        ..color = ThemeConstant.profileTextColor
                                        ..overflow = TextOverflow.ellipsis,
                                    ),
                                    n.Text("Joined date: 11/6/2022")
                                      ..fontSize = 13
                                      ..fontWeight = FontWeight.w300,
                                    n.Text("Products: 400")
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
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.74,
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
