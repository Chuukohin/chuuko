import 'package:chuukohin/constant/theme.dart';
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
        body: const TabBarView(
          children: [
            Text('Flight'),
            Text('Transit'),
          ],
        ),
      ),
    );
  }
}
