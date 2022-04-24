import 'package:chuukohin/constant/color.dart';
import 'package:chuukohin/screens/start/splash.dart';
import 'package:chuukohin/screens/start/welcome.dart';
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
      theme: ThemeData(
        primaryColor: ThemeConstant.primaryColor,
        primarySwatch: ThemeConstant.materialColorSwatch,
        appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xffF9F9F9), foregroundColor: Colors.black),
      ),
      routes: {
        '/': (_) => const SplashScreen(),
        '/welcome': (_) => const WelcomeScreen(),
      },
      initialRoute: "/",
    );
  }
}
//0xffB89476