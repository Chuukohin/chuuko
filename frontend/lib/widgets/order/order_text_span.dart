import 'package:chuukohin/constant/theme.dart';
import 'package:flutter/material.dart';

class OrderTextSpan extends StatelessWidget {
  final String title;
  final String text;
  const OrderTextSpan({Key? key, required this.title, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(
            text: title + ": ",
            style: TextStyle(
              color: ThemeConstant.secondaryColor,
              fontWeight: FontWeight.w700,
            ),
          ),
          TextSpan(
            text: text,
            style: TextStyle(
              color: ThemeConstant.secondaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
