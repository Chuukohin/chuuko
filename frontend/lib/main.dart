import 'package:chuukohin/constant/color.dart';
import 'package:chuukohin/screens/core/homepage_screen.dart';
import 'package:chuukohin/screens/start/splash.dart';
import 'package:chuukohin/screens/start/welcome.dart';
import 'package:flutter/material.dart';
import 'package:niku/namespace.dart' as n;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chuuko',
      theme: ThemeConstant.theme,
      routes: {
        '/': (_) => const SplashScreen(),
        '/welcome': (_) => const WelcomeScreen(),
        '/home': (_) => const HomepageScreen(),
      },
      initialRoute: "/home",
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return n.Column([n.Text("Chuukohin")..color = Colors.blue])
      ..padding = const EdgeInsets.all(8);
  }
}
