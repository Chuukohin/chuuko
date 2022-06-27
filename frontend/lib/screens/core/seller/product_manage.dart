import 'package:chuukohin/constant/theme.dart';
import 'package:chuukohin/widgets/product/product_card.dart';
import 'package:flutter/material.dart';

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
                itemCount: 10,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: screenHeight / 1100,
                  crossAxisSpacing: 10.0,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () =>
                        Navigator.pushNamed(context, '/product/preview'),
                    child: const ProductCard(
                        "T-Shirt", "Uniqlo", 100, 'assets/images/shirt.png'),
                  );
                },
              ),
              //sold
              GridView.builder(
                itemCount: 10,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: screenHeight / 1100,
                  crossAxisSpacing: 10.0,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return const Opacity(
                    opacity: .6,
                    child: ProductCard(
                        "T-Shirt", "Uniqlo", 100, 'assets/images/shirt.png'),
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
