import 'package:chuukohin/constant/theme.dart';
import 'package:chuukohin/screens/core/index.dart';
import 'package:chuukohin/screens/start/createproduct_screen.dart';
import 'package:chuukohin/screens/start/login_screen.dart';
import 'package:chuukohin/screens/start/myprofile_screen.dart';
import 'package:chuukohin/screens/start/preview_screen.dart';
import 'package:chuukohin/screens/core/me/me_screen.dart';
import 'package:chuukohin/screens/start/splash.dart';
import 'package:chuukohin/screens/start/welcome.dart';
import 'package:flutter/material.dart';
import 'package:chuukohin/screens/start/signup_screen.dart';
import 'package:chuukohin/screens/core/seller/sellersignup_screen.dart';

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
      routes: {
        '/': (_) => const SplashScreen(),
        '/welcome': (_) => const WelcomeScreen(),
        '/home': (_) => const MainScreen(),
        '/login': (_) => const LoginScreen(),
        '/signup': (_) => const SignupScreen(),
        '/sellersignup': (_) => const SellerSignupScreen(),
        '/me': (_) => const MeScreen(),
        '/createproduct': (_) => const CreateProductScreen(),
        '/preview': (_) => const PreviewScreen(),
        '/myprofile': (_) => const MyProfileScreen(),
      },
      initialRoute: "/home",
    );
  }
}
