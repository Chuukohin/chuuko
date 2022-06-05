import 'package:flutter/material.dart';

class SingupClick extends StatefulWidget {
  const SingupClick({Key? key}) : super(key: key);

  @override
  State<SingupClick> createState() => _SingupClickState();
}

class _SingupClickState extends State<SingupClick> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RichText(
          text: TextSpan(
            text: "Don't have account yet? ",
            style: TextStyle(
              fontSize: 14,
              color: Colors.black,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/signup');
          },
          child: Text(
            'Register',
            style: TextStyle(
              fontSize: 14,
              color: Color(0xff826751),
            ),
          ),
        )
      ],
    );
  }
}
