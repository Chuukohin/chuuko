import 'package:chuukohin/screens/core/home/homepage_screen.dart';
import 'package:chuukohin/screens/core/index.dart';
import 'package:chuukohin/screens/start/welcome.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _SplashScreenState();

  bool login = false;

  Future checkUser() async {
    final prefs = await SharedPreferences.getInstance();
    final String? userToken = prefs.getString('user');
    if (userToken != null) {
      setState(() {
        login = true;
      });
    } else {
      setState(() {
        login = false;
      });
    }
  }

  @override
  void initState() {
    checkUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
        splash: 'assets/images/logo.png',
        nextScreen: login ? const MainScreen() : const WelcomeScreen(),
        splashIconSize: 100,
        pageTransitionType: PageTransitionType.fade,
        duration: 1000,
      ),
    );
  }
}
