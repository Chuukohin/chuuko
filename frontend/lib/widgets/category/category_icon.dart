import 'package:chuukohin/constant/theme.dart';
import 'package:flutter/material.dart';
import 'package:niku/namespace.dart' as n;

class CategoryIcon extends StatelessWidget {
  final String url;
  const CategoryIcon({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 50,
      child: n.Stack(
        [
          Container(
            decoration: BoxDecoration(
                color: ThemeConstant.primaryColor, shape: BoxShape.circle),
          ),
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              url,
              width: 25,
              height: 25,
            ),
          )
        ],
      ),
    );
  }
}
