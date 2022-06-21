import 'package:chuukohin/constant/theme.dart';
import 'package:flutter/material.dart';

class TextForm extends StatefulWidget {
  final String title;
  final String subtitle;
  const TextForm({Key? key, required this.title, required this.subtitle})
      : super(key: key);

  @override
  State<TextForm> createState() => _TextFiledState();
}

class _TextFiledState extends State<TextForm> {
  bool _isRead = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: widget.title,
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
      readOnly: _isRead,
      decoration: InputDecoration(
          helperText: widget.subtitle,
          helperStyle: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: ThemeConstant.dividerColor),
          contentPadding: const EdgeInsets.only(top: 23),
          suffixIcon: IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              setState(() {
                _isRead = !_isRead;
              });
            },
          )),
    );
  }
}
