import 'package:chuukohin/types/widget/placement.dart';
import 'package:chuukohin/widgets/button.dart';
import 'package:chuukohin/widgets/typography/header_text.dart';
import 'package:flutter/material.dart';
import 'package:chuukohin/constant/theme.dart';
import 'package:chuukohin/widgets/me/textform.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  State<CardScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<CardScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus!.unfocus();
        }
      },
      behavior: HitTestBehavior.translucent,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text('Card'),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding:
                const EdgeInsets.only(top: 10, left: 30, right: 30, bottom: 20),
            child: Column(
              children: [
                Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            margin: const EdgeInsets.only(bottom: 5),
                            child: TextForm(
                              title: 'Card holder name',
                            )),
                        const Text(
                          'Fullname in your credit card',
                          style:
                              TextStyle(color: Color(0xffC1C1C1), fontSize: 13),
                        )
                      ],
                    )),
                Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            margin: const EdgeInsets.only(bottom: 5),
                            child: TextForm(
                              title: 'Card No.',
                            )),
                        const Text(
                          'Card No.',
                          style:
                              TextStyle(color: Color(0xffC1C1C1), fontSize: 13),
                        )
                      ],
                    )),
                Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            margin: const EdgeInsets.only(bottom: 5),
                            child: TextForm(
                              title: 'MM/YY',
                            )),
                        const Text(
                          'Expire date',
                          style:
                              TextStyle(color: Color(0xffC1C1C1), fontSize: 13),
                        )
                      ],
                    )),
                Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            margin: const EdgeInsets.only(bottom: 5),
                            child: TextForm(title: 'CVC')),
                        Container(
                          margin: const EdgeInsets.only(bottom: 270),
                          child: const Text(
                            'CVC',
                            style: TextStyle(
                                color: Color(0xffC1C1C1), fontSize: 13),
                          ),
                        )
                      ],
                    )),
                Container(
                  width: 300,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Save",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
