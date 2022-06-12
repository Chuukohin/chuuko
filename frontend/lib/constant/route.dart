import 'package:chuukohin/screens/core/index.dart';
import 'package:chuukohin/screens/core/me/card.dart';
import 'package:chuukohin/screens/core/me/me_screen.dart';
import 'package:chuukohin/screens/core/me/myprofile_screen.dart';
import 'package:chuukohin/screens/core/product/createproduct_screen.dart';
import 'package:chuukohin/screens/core/product/preview_screen.dart';
import 'package:chuukohin/screens/core/seller/my_shop.dart';
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
      '/seller/signup': (_) => const SellerSignupScreen(),
      '/me': (_) => const MeScreen(),
      '/product/create': (_) => const CreateProductScreen(),
      '/product/preview': (_) => const PreviewScreen(),
      '/profile': (_) => const MyProfileScreen(),
      '/profile/shop': (_) => const MyShopScreen(),
      '/card': (_) => const CardScreen(),
    };
  }
}
