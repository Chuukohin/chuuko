import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextForm extends StatefulWidget {
  String title;
  TextForm({Key? key, required this.title}) : super(key: key);

  @override
  State<TextForm> createState() => _TextFiledState();
}

class _TextFiledState extends State<TextForm> {
  bool _isRead = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: widget.title,
      style: const TextStyle(fontWeight: FontWeight.bold),
      readOnly: _isRead,
      decoration: InputDecoration(
          suffixIcon: IconButton(
        icon: const Icon(Icons.edit),
        onPressed: () {
          _isRead = !_isRead;
        },
      )),
    );
  }
}
