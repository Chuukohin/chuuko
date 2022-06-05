import 'package:chuukohin/widgets/button.dart';
import 'package:chuukohin/widgets/loginpage/passwordform.dart';
import 'package:chuukohin/widgets/loginpage/signupclick.dart';
import 'package:chuukohin/widgets/loginpage/textform.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:chuukohin/widgets/loginpage/textform.dart';
import 'package:chuukohin/widgets/loginpage/passwordform.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Center(
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/loginpic.png",
                  ),
                  Container(
                    width: 307,
                    child: Text(
                      'Welcome back!',
                      style: TextStyle(
                          color: Color(0xff6C4E37),
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 19),
                  Textform(title: 'Email'),
                  SizedBox(height: 26),
                  Password(),
                  SizedBox(
                    height: 9,
                  ),
                  Container(
                    width: 307,
                    child: Text(
                      'Forgot password ? ',
                      style: TextStyle(color: Color(0xff826751), fontSize: 14),
                      textAlign: TextAlign.end,
                    ),
                  ),
                  SizedBox(
                    height: 17,
                  ),
                  MainButton('Login', 48, 307),
                  SizedBox(
                    height: 200,
                  ),
                  SingupClick(),
                ],
              ),
            )));
  }
}
