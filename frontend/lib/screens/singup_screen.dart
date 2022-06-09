import 'package:chuukohin/widgets/signupage/checkcondi.dart';
import 'package:flutter/material.dart';
import 'package:chuukohin/widgets/loginpage/textform.dart';
import 'package:chuukohin/widgets/button.dart';
import 'package:chuukohin/constant/color.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SingupState();
}

class _SingupState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Center(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Create an account',
              style: TextStyle(
                  color: ThemeConstant.secondaryColor,
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 23,
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Firstname - Lastname',
                    style: TextStyle(
                      color: Color(0xff665A5A),
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Textform(title: 'Firstname'),
                  SizedBox(
                    height: 10,
                  ),
                  Textform(title: 'Lastname'),
                ],
              ),
            ),
            SizedBox(
              height: 28,
            ),
            Container(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Email',
                      style: TextStyle(
                        color: Color(0xff665A5A),
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Textform(title: 'Email'),
                  ]),
            ),
            SizedBox(
              height: 28,
            ),
            Container(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Password',
                      style: TextStyle(
                        color: Color(0xff665A5A),
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Textform(title: 'Password'),
                    SizedBox(
                      height: 10,
                    ),
                    Textform(title: 'Confirm Password'),
                  ]),
            ),
            SizedBox(
              height: 50,
            ),
            Check(),
            MainButton('Sign Up', 48, 307, '/login')
          ],
        )),
      ),
    );
  }
}
