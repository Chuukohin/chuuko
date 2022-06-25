import 'package:chuukohin/models/response/error/error_response.dart';
import 'package:chuukohin/screens/core/home/homepage_screen.dart';
import 'package:chuukohin/services/account.dart';
import 'package:chuukohin/types/widget/placement.dart';
import 'package:chuukohin/widgets/typography/header_text.dart';
import 'package:flutter/material.dart';
import 'package:chuukohin/constant/theme.dart';
import 'package:niku/namespace.dart' as n;

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignUpState();
}

class _SignUpState extends State<SignupScreen> {
  bool _checked = false;
  String _isError = "";
  final _firstnameController = TextEditingController();
  final _lastnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  void handleRegister() async {
    if (_checked) {
      var register = await AccountService.register(
          _firstnameController.text,
          _lastnameController.text,
          _emailController.text,
          _passwordController.text,
          _confirmPasswordController.text);
      if (register is ErrorResponse) {
        setState(() {
          _isError = register.message;
        });
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePageScreen(),
          ),
        );
        _firstnameController.clear();
        _lastnameController.clear();
        _emailController.clear();
        _passwordController.clear();
        _confirmPasswordController.clear();
      }
    } else {
      setState(() {
        _isError = "Please accept the terms and conditions";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus!.unfocus();
        }
      },
      behavior: HitTestBehavior.translucent,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.only(top: 8, left: 30, right: 30, bottom: 20),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 24),
                    child: HeaderText(
                      text: 'Create an account',
                      size: Size.large,
                      color: ThemeConstant.secondaryColor,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 8),
                          child: Text(
                            'Firstname - Lastname',
                            style: TextStyle(
                              color: ThemeConstant.textSecondaryColor,
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          child: TextFormField(
                            controller: _firstnameController,
                            decoration: InputDecoration(
                              hintText: 'Firstname',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: BorderSide(
                                  color: ThemeConstant.primaryColor,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: ThemeConstant.primaryColor,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                            onChanged: (_) {
                              setState(() {
                                _isError = "";
                              });
                            },
                          ),
                        ),
                        TextFormField(
                          controller: _lastnameController,
                          decoration: InputDecoration(
                            hintText: 'Lastname',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                              borderSide: BorderSide(
                                color: ThemeConstant.primaryColor,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: ThemeConstant.primaryColor,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                          onChanged: (_) {
                            setState(() {
                              _isError = "";
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 8),
                            child: Text(
                              'Email',
                              style: TextStyle(
                                color: ThemeConstant.textSecondaryColor,
                              ),
                            ),
                          ),
                          TextFormField(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              hintText: 'Email',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: BorderSide(
                                  color: ThemeConstant.primaryColor,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: ThemeConstant.primaryColor,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                            onChanged: (_) {
                              setState(() {
                                _isError = "";
                              });
                            },
                          ),
                        ]),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 8),
                          child: Text(
                            'Password',
                            style: TextStyle(
                              color: ThemeConstant.textSecondaryColor,
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          child: TextFormField(
                            controller: _passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: 'Password',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: BorderSide(
                                  color: ThemeConstant.primaryColor,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: ThemeConstant.primaryColor,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                            onChanged: (_) {
                              setState(() {
                                _isError = "";
                              });
                            },
                          ),
                        ),
                        TextFormField(
                          controller: _confirmPasswordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'Confirm Password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                              borderSide: BorderSide(
                                color: ThemeConstant.primaryColor,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: ThemeConstant.primaryColor,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                          onChanged: (_) {
                            setState(() {
                              _isError = "";
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    child: CheckboxListTile(
                      title: n.Text('I agree to the terms and conditions'),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                      value: _checked,
                      onChanged: (value) {
                        setState(() {
                          _checked = !_checked;
                        });
                      },
                      activeColor: ThemeConstant.primaryColor,
                      checkColor: Colors.white,
                      controlAffinity: ListTileControlAffinity.leading,
                    ),
                  ),
                  _isError.isNotEmpty
                      ? Container(
                          margin: const EdgeInsets.only(top: 8, bottom: 10),
                          width: double.infinity,
                          child: n.Text(_isError)
                            ..color = ThemeConstant.logOutBtnColor
                            ..textAlign = TextAlign.center,
                        )
                      : Container(),
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
                        handleRegister();
                      },
                      child: const Text(
                        'Register',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
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
