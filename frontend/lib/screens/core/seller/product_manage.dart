import 'package:chuukohin/constant/theme.dart';
import 'package:chuukohin/services/provider/provider.dart';
import 'package:chuukohin/widgets/product/product_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductManagementScreen extends StatefulWidget {
  const ProductManagementScreen({Key? key}) : super(key: key);

  @override
  State<ProductManagementScreen> createState() =>
      _ProductManagementScreenState();
}

class _ProductManagementScreenState extends State<ProductManagementScreen> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 1,
          title: const Text('Product Management'),
          bottom: TabBar(
            indicatorColor: ThemeConstant.primaryColor,
            unselectedLabelColor: ThemeConstant.dividerColor,
            labelColor: ThemeConstant.primaryColor,
            tabs: const [
              Tab(
                text: 'In shop',
              ),
              Tab(
                text: 'Sold',
              ),
            ],
          ),
        ),
        body: Container(
          padding: const EdgeInsets.only(top: 12, left: 12, right: 12),
          child: TabBarView(
            children: [
              //in shop
              GridView.builder(
                itemCount: Provider.of<SellerProvider>(context, listen: true)
                    .sellingProducts
                    .length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: screenHeight / 1100,
                  crossAxisSpacing: 10.0,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () => Provider.of<SellerProvider>(context,
                            listen: false)
                        .getProductDetail(
                            Provider.of<SellerProvider>(context, listen: false)
                                .sellingProducts[index]
                                .id
                                .toString())
                        .then(
                          (_) =>
                              Navigator.pushNamed(context, '/product/preview'),
                        ),
                    child: ProductCard(
                        Provider.of<SellerProvider>(context, listen: false)
                            .sellingProducts[index]
                            .name,
                        Provider.of<SellerProvider>(context, listen: false)
                            .sellingProducts[index]
                            .brand,
                        Provider.of<SellerProvider>(context, listen: false)
                            .sellingProducts[index]
                            .price,
                        Provider.of<SellerProvider>(context, listen: false)
                            .sellingProducts[index]
                            .pictureUrl),
                  );
                },
              ),
              //sold
              GridView.builder(
                itemCount: Provider.of<SellerProvider>(context, listen: true)
                    .soldProducts
                    .length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: screenHeight / 1100,
                  crossAxisSpacing: 10.0,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return Opacity(
                    opacity: .6,
                    child: ProductCard(
                        Provider.of<SellerProvider>(context, listen: false)
                            .soldProducts[index]
                            .name,
                        Provider.of<SellerProvider>(context, listen: false)
                            .soldProducts[index]
                            .brand,
                        Provider.of<SellerProvider>(context, listen: false)
                            .soldProducts[index]
                            .price,
                        Provider.of<SellerProvider>(context, listen: false)
                            .soldProducts[index]
                            .pictureUrl),
                  );
                },
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/product/create');
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
