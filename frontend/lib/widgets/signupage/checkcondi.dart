import 'package:chuukohin/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:niku/macros/macros.dart';

class Check extends StatefulWidget {
  Check({
    Key? key,
  }) : super(key: key);

  @override
  State<Check> createState() => _CheckState();
}

class _CheckState extends State<Check> {
  bool _checked = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CheckboxListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 45),
        title: Text('I agree to terms and conditions'),
        value: _checked,
        onChanged: (value) {
          setState(() {
            _checked = !_checked;
          });
        },
        activeColor: ThemeConstant.primaryColor,
        checkColor: Colors.white,
        controlAffinity: ListTileControlAffinity.leading,
      ),
    );
  }
}
