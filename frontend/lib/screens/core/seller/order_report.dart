import 'package:chuukohin/constant/theme.dart';
import 'package:chuukohin/screens/core/seller/order_report/order_report_detail.dart';
import 'package:chuukohin/screens/core/seller/order_report/order_detail.dart';
import 'package:chuukohin/services/provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:niku/namespace.dart' as n;
import 'package:provider/provider.dart';

class OrderReportScreen extends StatefulWidget {
  const OrderReportScreen({Key? key}) : super(key: key);

  @override
  State<OrderReportScreen> createState() => _OrderReportScreenState();
}

class _OrderReportScreenState extends State<OrderReportScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: n.Text('Order Report'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 8, left: 12, right: 12),
          child: _currentIndex == 0
              ? Column(
                  children: Provider.of<SellerProvider>(context, listen: false)
                      .sendingOrder
                      .map(
                        (order) => GestureDetector(
                          onTap: () => context
                              .read<ProfileProvider>()
                              .getOrderDetail(order.orderId.toString())
                              .then(
                                (_) => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const OrderDetail(),
                                  ),
                                ),
                              ),
                          behavior: HitTestBehavior.translucent,
                          child: OrderReportDetail(
                            productName: order.customerName,
                            orderId: order.orderId.toString(),
                            orderTime: order.orderTime,
                            productPicture: order.productPicture,
                          ),
                        ),
                      )
                      .toList(),
                )
              : Column(
                  children: Provider.of<SellerProvider>(context, listen: false)
                      .sentOrder
                      .map(
                        (order) => GestureDetector(
                          onTap: () => context
                              .read<ProfileProvider>()
                              .getOrderDetail(order.orderId.toString())
                              .then(
                                (_) => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const OrderDetail(),
                                  ),
                                ),
                              ),
                          behavior: HitTestBehavior.translucent,
                          child: OrderReportDetail(
                            productName: order.customerName,
                            orderId: order.orderId.toString(),
                            orderTime: order.orderTime,
                            productPicture: order.productPicture,
                          ),
                        ),
                      )
                      .toList(),
                ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
            child: GNav(
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: ThemeConstant.primaryColor,
              iconSize: 26,
              tabBorderRadius: 15,
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 12),
              duration: const Duration(milliseconds: 200),
              tabBackgroundColor: Colors.white,
              color: const Color(0xffDADADA),
              tabs: const [
                GButton(
                  icon: Icons.local_shipping_rounded,
                  text: 'Sending',
                ),
                GButton(
                  icon: CupertinoIcons.cube_box_fill,
                  text: 'Sent',
                ),
              ],
              onTabChange: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
