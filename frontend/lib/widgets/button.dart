import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  String title;
  double height;
  double width;
  MainButton(this.title, this.height, this.width);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            borderRadius: new BorderRadius.all(Radius.circular(39)),
            color: Color(0xFFB89476)),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 17,
              color: Colors.white,
            ),
          ),
        ));
  }
}
