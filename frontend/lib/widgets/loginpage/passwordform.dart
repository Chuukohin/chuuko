import 'package:chuukohin/constant/color.dart';
import 'package:flutter/material.dart';

class Password extends StatefulWidget {
  const Password({Key? key}) : super(key: key);

  @override
  State<Password> createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 307,
        child: TextFormField(
          obscureText: _isObscure,
          decoration: InputDecoration(
              labelText: 'Password',
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(13.0),
                  borderSide: BorderSide(color: ThemeConstant.primaryColor)),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: ThemeConstant.primaryColor),
                borderRadius: BorderRadius.circular(13.0),
              ),
              suffixIcon: IconButton(
                icon:
                    Icon(_isObscure ? Icons.visibility : Icons.visibility_off),
                onPressed: () {
                  setState(() {
                    _isObscure = !_isObscure;
                  });
                },
              )),
        ));
  }
}
