import 'package:chuukohin/types/widget/placement.dart';
import 'package:chuukohin/widgets/button.dart';
import 'package:chuukohin/widgets/typography/header_text.dart';
import 'package:flutter/material.dart';
import 'package:chuukohin/constant/theme.dart';
import 'package:chuukohin/widgets/me/textform.dart';

class MyAddressScreen extends StatefulWidget {
  const MyAddressScreen({Key? key}) : super(key: key);

  @override
  State<MyAddressScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<MyAddressScreen> {
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
          title: Text('My adress'),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding:
                const EdgeInsets.only(top: 10, left: 30, right: 30, bottom: 20),
            child: Column(
              children: [
                Container(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        margin: const EdgeInsets.only(bottom: 5),
                        child: TextForm(
                          title: 'Firstname - Lastname',
                          subtitle: 'Fullname',
                        )),
                  ],
                )),
                Container(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        margin: const EdgeInsets.only(bottom: 25),
                        child: TextForm(
                          title: '082-000-0000',
                          subtitle: 'Phone number',
                        )),
                  ],
                )),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.only(bottom: 5),
                    child: Text(
                      'My Address',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        margin: const EdgeInsets.only(bottom: 5),
                        child: TextForm(
                          title: 'Phracha uthit',
                          subtitle: 'Street',
                        )),
                  ],
                )),
                Container(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        margin: const EdgeInsets.only(bottom: 5),
                        child: TextForm(
                          title: 'Bangkok',
                          subtitle: 'Province',
                        )),
                  ],
                )),
                Container(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        margin: const EdgeInsets.only(bottom: 5),
                        child: TextForm(
                          title: 'Thung Kru',
                          subtitle: 'District',
                        )),
                  ],
                )),
                Container(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        margin: const EdgeInsets.only(bottom: 5),
                        child: TextForm(
                          title: 'Bangmod',
                          subtitle: 'Sub-District',
                        )),
                  ],
                )),
                Container(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        margin: const EdgeInsets.only(bottom: 40),
                        child: TextForm(
                          title: '10140',
                          subtitle: 'Postal Code',
                        )),
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
