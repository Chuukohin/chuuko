import 'package:chuukohin/constant/theme.dart';
import 'package:chuukohin/screens/core/homepage_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:niku/namespace.dart' as n;
import 'package:google_nav_bar/google_nav_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  final _textController = TextEditingController(text: '');

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
          appBar: _currentIndex == 0
              ? AppBar(
                  automaticallyImplyLeading: false,
                  elevation: 1,
                  leading: Container(
                    padding: const EdgeInsets.only(left: 16),
                    child: Image.asset(
                      'assets/images/logo.png',
                    ),
                  ),
                  leadingWidth: 40,
                  title: SizedBox(
                    child: n.Column(
                      [
                        CupertinoSearchTextField(
                          controller: _textController,
                          style: const TextStyle(fontSize: 14),
                          itemColor: ThemeConstant.primaryColor,
                        ),
                      ],
                    ),
                  ),
                )
              : null,
          body: SizedBox(
            child: _currentIndex == 0 ? const HomePageScreen() : n.Text("Me"),
          ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  color: Colors.black.withOpacity(.05),
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
