import 'package:chuukohin/widgets/button.dart';
import 'package:flutter/material.dart';

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
        body: Container(
          child: Column(
            children: [
              //put testing code here
              const Text("Test"),
              const Text("Hello World"),
              MainButton('test', 50, 50)
            ],
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
