import 'package:chuukohin/constant/theme.dart';
import 'package:chuukohin/screens/core/home/homepage_screen.dart';
import 'package:chuukohin/screens/core/me/me_screen.dart';
import 'package:chuukohin/services/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  String userType = 'user';
  late SharedPreferences prefs;

  void readJson() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('user');
    Map<String, dynamic> payload = Jwt.parseJwt(token!);
    if (payload['seller_id'] != null) {
      context
          .read<SellerProvider>()
          .setSellerId(payload['seller_id'].toString());
      setState(() {
        userType = 'seller';
      });
    } else {
      setState(() {
        userType = 'user';
      });
    }
  }

  @override
  void initState() {
    super.initState();
    context.read<HomeProvider>().getHomeProduct();
    context.read<ProfileProvider>().getAddressInfo();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus &&
              currentFocus.focusedChild != null) {
            FocusManager.instance.primaryFocus!.unfocus();
          }
        },
        behavior: HitTestBehavior.translucent,
        child: Scaffold(
          body: SizedBox(
            child: _currentIndex == 0
                ? const HomePageScreen()
                : MeScreen(
                    userType: userType,
                  ),
          ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  color: Colors.black.withOpacity(.1),
                )
              ],
            ),
            child: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                child: GNav(
                  hoverColor: Colors.grey[100]!,
                  gap: 8,
                  activeColor: ThemeConstant.primaryColor,
                  iconSize: 26,
                  tabBorderRadius: 15,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 12),
                  duration: const Duration(milliseconds: 200),
                  tabBackgroundColor: Colors.white,
                  color: const Color(0xffDADADA),
                  tabs: const [
                    GButton(
                      icon: Icons.home,
                      text: 'Home',
                    ),
                    GButton(
                      icon: Icons.person,
                      text: 'Me',
                    ),
                  ],
                  onTabChange: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
