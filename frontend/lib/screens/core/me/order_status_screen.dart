import 'package:chuukohin/constant/theme.dart';
import 'package:chuukohin/screens/core/seller/order_report/order_detail.dart';
import 'package:chuukohin/screens/core/seller/order_report/order_report_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:niku/namespace.dart' as n;

class OrderStatusScreen extends StatefulWidget {
  const OrderStatusScreen({Key? key}) : super(key: key);

  @override
  State<OrderStatusScreen> createState() => _OrderStatusScreenState();
}

class _OrderStatusScreenState extends State<OrderStatusScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: n.Text('Order Status'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 8, left: 12, right: 12),
          child: _currentIndex == 0
              ? Column(
                  children: [
                    for (var i = 0; i < 6; i++)
                      GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const OrderDetail(),
                          ),
                        ),
                        behavior: HitTestBehavior.translucent,
                        child: const OrderReportDetail(),
                      ),
                  ],
                )
              : Column(
                  children: [
                    for (var i = 0; i < 4; i++)
                      GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const OrderDetail(),
                          ),
                        ),
                        behavior: HitTestBehavior.translucent,
                        child: const OrderReportDetail(),
                      ),
                  ],
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
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
              duration: const Duration(milliseconds: 200),
              tabBackgroundColor: Colors.white,
              color: const Color(0xffDADADA),
              tabs: const [
                GButton(
                  icon: Icons.local_shipping_rounded,
                  text: 'To receive',
                ),
                GButton(
                  icon: CupertinoIcons.cube_box_fill,
                  text: 'Received',
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
