import 'package:chuukohin/screens/core/index.dart';
import 'package:chuukohin/screens/core/me/me_screen.dart';
import 'package:chuukohin/screens/core/me/myprofile_screen.dart';
import 'package:chuukohin/screens/core/product/createproduct_screen.dart';
import 'package:chuukohin/screens/core/product/preview_screen.dart';
import 'package:chuukohin/screens/core/seller/sellersignup_screen.dart';
import 'package:chuukohin/screens/start/login_screen.dart';
import 'package:chuukohin/screens/start/signup_screen.dart';
import 'package:chuukohin/screens/start/splash.dart';
import 'package:chuukohin/screens/start/welcome.dart';
import 'package:flutter/material.dart' as material;

class RouteConstant {
  static Map<String, material.WidgetBuilder> route() {
    return <String, material.WidgetBuilder>{
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
    };
  }
}
