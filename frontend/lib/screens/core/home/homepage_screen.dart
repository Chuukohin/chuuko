import 'dart:convert';
import 'package:chuukohin/constant/theme.dart';
import 'package:chuukohin/screens/core/category/category_screen.dart';
import 'package:chuukohin/screens/core/product/product_detail_screen.dart';
import 'package:chuukohin/services/provider/provider.dart';
import 'package:chuukohin/widgets/category/category_icon.dart';
import 'package:chuukohin/widgets/product/product_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:niku/namespace.dart' as n;
import 'package:collection/collection.dart';
import 'package:provider/provider.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  List _categories = [];
  final _textController = TextEditingController(text: '');
  late ScrollController _scrollController;

  _loadCategories() async {
    final String response =
        await rootBundle.loadString('assets/json/category.json');
    final data = await json.decode(response);
    setState(() {
      _categories = data;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadCategories();
    context.read<ProfileProvider>().getMeData();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToTop() {
    _scrollController.animateTo(0,
        duration: const Duration(milliseconds: 500), curve: Curves.linear);
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => _scrollToTop(),
          child: Container(
            padding: const EdgeInsets.only(left: 16),
            child: Image.asset(
              'assets/images/logo.png',
            ),
          ),
        ),
        leadingWidth: 40,
        title: SizedBox(
          child: n.Column(
            [
              CupertinoSearchTextField(
                controller: _textController,
                style: const TextStyle(fontSize: 14),
                itemColor: ThemeConstant.primaryColor,
              ),
            ],
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 16),
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  n.Column(
                    [
                      Container(
                        width: double.infinity,
                        margin: const EdgeInsets.only(bottom: 20, left: 20),
                        child: n.Text("Categories")
                          ..fontWeight = FontWeight.bold
                          ..fontSize = 16,
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        height: 80,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: _categories.mapIndexed((index, category) {
                            return Container(
                              width: 65,
                              margin: index == 0
                                  ? const EdgeInsets.only(left: 14)
                                  : index == _categories.length - 1
                                      ? const EdgeInsets.only(right: 20)
                                      : null,
                              child: Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      context
                                          .read<HomeProvider>()
                                          .getCategoryProduct(category['id'])
                                          .then((_) => {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        CategoryScreen(
                                                      title: category['name'],
                                                    ),
                                                  ),
                                                )
                                              });
                                    },
                                    behavior: HitTestBehavior.translucent,
                                    child: Container(
                                      margin: const EdgeInsets.only(bottom: 8),
                                      child:
                                          CategoryIcon(url: category['icon']),
                                    ),
                                  ),
                                  n.Text(category['name'])
                                    ..fontSize = 12
                                    ..fontWeight = FontWeight.w500
                                    ..textAlign = TextAlign.center
                                    ..overflow = TextOverflow.ellipsis,
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  )..crossAxisAlignment = CrossAxisAlignment.start,
                ],
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.only(left: 12, right: 12),
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
                        Provider.of<SellerProvider>(context, listen: false)
                            .getProductDetail(Provider.of<HomeProvider>(context,
                                    listen: false)
                                .homeProduct[index]
                                .id
                                .toString())
                            .then(
                              (_) => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const ProductDetailScreen(),
                                ),
                              ),
                            );
                      },
                      child: ProductCard(
                          Provider.of<HomeProvider>(context, listen: true)
                              .homeProduct[index]
                              .name,
                          Provider.of<HomeProvider>(context, listen: true)
                              .homeProduct[index]
                              .brand,
                          Provider.of<HomeProvider>(context, listen: true)
                              .homeProduct[index]
                              .price,
                          Provider.of<HomeProvider>(context, listen: true)
                              .homeProduct[index]
                              .pictureUrl),
                    );
                  },
                  childCount: Provider.of<HomeProvider>(context, listen: true)
                      .homeProduct
                      .length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
