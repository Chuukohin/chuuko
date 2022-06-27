import 'package:chuukohin/constant/theme.dart';
import 'package:flutter/material.dart';

class TextForm extends StatefulWidget {
  final String title;
  final String subtitle;
  final TextEditingController controller;
  const TextForm(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.controller})
      : super(key: key);

  @override
  State<TextForm> createState() => _TextFiledState();
}

class _TextFiledState extends State<TextForm> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
      decoration: InputDecoration(
        hintText: widget.title,
        hintStyle: TextStyle(
          color: ThemeConstant.dividerColor,
        ),
        helperText: widget.subtitle,
        helperStyle: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold,
            color: ThemeConstant.dividerColor),
        contentPadding: const EdgeInsets.only(top: 23),
      ),
    );
  }
}
