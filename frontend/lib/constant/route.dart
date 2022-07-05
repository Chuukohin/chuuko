import 'package:chuukohin/screens/core/index.dart';
import 'package:chuukohin/screens/core/me/card_screen.dart';
import 'package:chuukohin/screens/core/me/me_screen.dart';
import 'package:chuukohin/screens/core/me/myaddress_screen.dart';
import 'package:chuukohin/screens/core/me/myprofile_screen.dart';
import 'package:chuukohin/screens/core/me/order_status_screen.dart';
import 'package:chuukohin/screens/core/product/createproduct_screen.dart';
import 'package:chuukohin/screens/core/product/preview_screen.dart';
import 'package:chuukohin/screens/core/seller/income.dart';
import 'package:chuukohin/screens/core/seller/my_shop.dart';
import 'package:chuukohin/screens/core/seller/order_report.dart';
import 'package:chuukohin/screens/core/seller/order_report/order_detail.dart';
import 'package:chuukohin/screens/core/seller/product_manage.dart';
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
      '/product/create': (_) => const CreateProductScreen(),
      '/product/preview': (_) => const PreviewScreen(),
      '/me': (_) => const MeScreen(),
      '/profile': (_) => const MyProfileScreen(),
      '/profile/card': (_) => const CardScreen(),
      '/profile/address': (_) => const MyAddressScreen(),
      '/profile/order/status': (_) => const OrderStatusScreen(),
      '/seller/signup': (_) => const SellerSignupScreen(),
      '/seller/shop': (_) => const MyShopScreen(),
      '/seller/product/manage': (_) => const ProductManagementScreen(),
      '/seller/income': (_) => const IncomeScreen(),
      '/seller/order': (_) => const OrderReportScreen(),
      '/seller/order/detail': (_) => const OrderDetail(),
    };
  }
}
