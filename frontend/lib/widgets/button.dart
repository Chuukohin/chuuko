import 'package:chuukohin/constant/color.dart';
import 'package:flutter/material.dart';

class MainButton extends StatefulWidget {
  final String title;
  final double height;
  final double width;
  final String navigator;
  const MainButton(this.title, this.height, this.width, this.navigator,
      {Key? key})
      : super(key: key);

  @override
  State<MainButton> createState() => _MainButtonState();
}

class _MainButtonState extends State<MainButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          onSurface: (ThemeConstant.primaryColor),
          fixedSize: Size(widget.width, widget.height),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(39),
          )),
      onPressed: () {
        Navigator.pushNamed(context, widget.navigator);
      },
      child: Text(
        widget.title,
        style: TextStyle(color: Colors.white, fontSize: 17),
        textAlign: TextAlign.center,
      ),
    );
  }
}
