import 'package:chuukohin/models/response/account/account_response.dart';
import 'package:chuukohin/models/response/error/error_response.dart';
import 'package:chuukohin/screens/core/home/homepage_screen.dart';
import 'package:chuukohin/services/account.dart';
import 'package:chuukohin/types/widget/placement.dart';
import 'package:chuukohin/widgets/button.dart';
import 'package:chuukohin/widgets/typography/header_text.dart';
import 'package:flutter/material.dart';
import 'package:chuukohin/constant/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isObscure = true;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void handleLogin() async {
    final prefs = await SharedPreferences.getInstance();
    print('logging in');
    var login = await AccountService.login(
        _emailController.text, _passwordController.text);
    if (login is ErrorResponse) {
      print("ERROR");
      print(login.message);
    } else if (login is LoginResponse) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePageScreen(),
        ),
      );
      print(prefs.getString('user'));
      _emailController.clear();
      _passwordController.clear();
    } else {
      print("Error");
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
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
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                  top: screenHeight / 8, left: 30, right: 30, bottom: 20),
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/login-pic.jpg",
                    width: 300,
                  ),
                  SizedBox(
                    height: screenHeight / 1.8,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 16),
                              width: double.infinity,
                              child: HeaderText(
                                text: 'Welcome Back!',
                                size: Size.large,
                                color: ThemeConstant.secondaryColor,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(bottom: 16),
                              child: TextFormField(
                                controller: _emailController,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  labelText: 'Email',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(14.0),
                                    borderSide: BorderSide(
                                        color: ThemeConstant.primaryColor),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: ThemeConstant.primaryColor),
                                    borderRadius: BorderRadius.circular(14.0),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(bottom: 16),
                              child: TextFormField(
                                controller: _passwordController,
                                obscureText: _isObscure,
                                decoration: InputDecoration(
                                    labelText: 'Password',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(14.0),
                                      borderSide: BorderSide(
                                          color: ThemeConstant.primaryColor),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: ThemeConstant.primaryColor),
                                      borderRadius: BorderRadius.circular(14.0),
                                    ),
                                    suffixIcon: IconButton(
                                      icon: Icon(_isObscure
                                          ? Icons.visibility
                                          : Icons.visibility_off),
                                      onPressed: () {
                                        setState(() {
                                          _isObscure = !_isObscure;
                                        });
                                      },
                                    )),
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerRight,
                              margin: const EdgeInsets.only(bottom: 16),
                              child: Text(
                                'Forgot password?',
                                style: TextStyle(
                                  color: ThemeConstant.textSecondaryColor,
                                ),
                                textAlign: TextAlign.end,
                              ),
                            ),
                            SizedBox(
                              width: 300,
                              height: 50,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                ),
                                onPressed: () {
                                  handleLogin();
                                },
                                child: const Text(
                                  'Login',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Doesn't have an account yet? ",
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/signup');
                              },
                              child: Text(
                                'Register',
                                style: TextStyle(
                                  color: ThemeConstant.textSecondaryColor,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
