import 'package:flutter/material.dart';

class MainButton extends StatefulWidget {
  final String title;
  final double height;
  final double width;
  const MainButton(this.title, this.height, this.width, {Key? key})
      : super(key: key);

  @override
  State<MainButton> createState() => _MainButtonState();
}

class _MainButtonState extends State<MainButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          onSurface: (Color(0xffB89476)),
          fixedSize: Size(widget.width, widget.height),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(39),
          )),
      onPressed: () {},
      child: Text(
        widget.title,
        style: TextStyle(color: Colors.white, fontSize: 17),
        textAlign: TextAlign.center,
      ),
    );
  }
}
