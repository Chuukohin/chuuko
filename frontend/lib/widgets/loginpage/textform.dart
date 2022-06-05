import 'package:flutter/material.dart';

class Textform extends StatefulWidget {
  const Textform({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<Textform> createState() => _TextformState();
}

class _TextformState extends State<Textform> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 307,
      child: TextFormField(
          decoration: InputDecoration(
              labelText: widget.title,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(13.0),
                  borderSide: BorderSide(color: Color(0xffB89476))),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xffB89476)),
                borderRadius: BorderRadius.circular(13.0),
              ))),
    );
  }
}
