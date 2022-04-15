import 'package:chuukohin/widgets/button.dart';
import 'package:chuukohin/widgets/layout/product_detail.dart';
import 'package:flutter/material.dart';
// import 'package:chuukohin/widgets/layout/product_card.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Test Screen"),
        ),
        body: Column(
          children: const [
            //put testing code here
            Text("Test"),
            Text("Hello World"),
            MainButton('test', 50, 50),

            Product_Detail("Product name", "uniqol", "Shrit", "Bangkok", 5000,
                "white shirt sdcsdcdscvdsvdsv")
          ],
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
