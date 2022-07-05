import 'package:chuukohin/screens/core/product/product_detail_screen.dart';
import 'package:chuukohin/services/provider/provider.dart';
import 'package:chuukohin/widgets/product/product_card.dart';
import 'package:flutter/material.dart';
import 'package:niku/namespace.dart' as n;
import 'package:provider/provider.dart';

class CategoryScreen extends StatefulWidget {
  final String title;
  const CategoryScreen({Key? key, required this.title}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: n.Text(
          widget.title,
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding:
                const EdgeInsets.only(left: 12, right: 12, top: 14, bottom: 30),
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
                          .getProductDetail(
                              Provider.of<HomeProvider>(context, listen: false)
                                  .categoryProduct[index]
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
                        Provider.of<HomeProvider>(context, listen: false)
                            .categoryProduct[index]
                            .name,
                        Provider.of<HomeProvider>(context, listen: false)
                            .categoryProduct[index]
                            .brand,
                        Provider.of<HomeProvider>(context, listen: false)
                            .categoryProduct[index]
                            .price,
                        Provider.of<HomeProvider>(context, listen: false)
                            .categoryProduct[index]
                            .pictureUrl),
                  );
                },
                childCount: Provider.of<HomeProvider>(context, listen: true)
                    .categoryProduct
                    .length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
