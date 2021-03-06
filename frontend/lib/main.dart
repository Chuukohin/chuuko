import 'package:chuukohin/constant/route.dart';
import 'package:chuukohin/constant/theme.dart';
import 'package:chuukohin/services/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProfileProvider()),
        ChangeNotifierProvider(create: (_) => SellerProvider()),
        ChangeNotifierProvider(create: (_) => HomeProvider()),
      ],
      child: const Chuuko(),
    ),
  );
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
      initialRoute: "/",
    );
  }
}
