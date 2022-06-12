import 'package:flutter/material.dart';
import 'package:niku/namespace.dart' as n;

class OrderReportScreen extends StatefulWidget {
  const OrderReportScreen({Key? key}) : super(key: key);

  @override
  State<OrderReportScreen> createState() => _OrderReportScreenState();
}

class _OrderReportScreenState extends State<OrderReportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: n.Text('Order Report'),
      ),
    );
  }
}
