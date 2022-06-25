import 'package:chuukohin/constant/route.dart';
import 'package:chuukohin/constant/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Chuuko());
}

class Chuuko extends StatelessWidget {
  const Chuuko({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chuuko',
      theme: ThemeConstant.theme,
      routes: RouteConstant.route(),
      initialRoute: "/login",
    );
  }
}
