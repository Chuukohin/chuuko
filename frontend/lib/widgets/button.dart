import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final String title;
  final double height;
  final double width;
  const MainButton(this.title, this.height, this.width, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: width,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(39)),
            color: Color(0xFFB89476)),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 17,
              color: Colors.white,
            ),
          ),
        ));
  }
}
