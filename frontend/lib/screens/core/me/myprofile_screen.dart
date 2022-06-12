import 'package:chuukohin/types/widget/placement.dart';
import 'package:chuukohin/widgets/button.dart';
import 'package:chuukohin/widgets/typography/header_text.dart';
import 'package:flutter/material.dart';
import 'package:chuukohin/constant/theme.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({Key? key}) : super(key: key);

  @override
  State<MyProfileScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<MyProfileScreen> {
  bool _isRead = true;

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
        appBar: AppBar(elevation: 0),
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
                          child: TextFormField(
                            initialValue: 'Firstname',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                            readOnly: _isRead,
                            decoration: InputDecoration(
                                suffixIcon: IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () {
                                _isRead = !_isRead;
                              },
                            )),
                          ),
                        ),
                        const Text(
                          'Firstname ',
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
                          child: TextFormField(
                            initialValue: 'Lastname',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                            readOnly: _isRead,
                            decoration: InputDecoration(
                                suffixIcon: IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () {
                                _isRead = !_isRead;
                              },
                            )),
                          ),
                        ),
                        const Text(
                          'Lastname ',
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
                          child: TextFormField(
                            initialValue: 'email@gmail.com',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                            readOnly: _isRead,
                            decoration: InputDecoration(
                                suffixIcon: IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () {
                                _isRead = !_isRead;
                              },
                            )),
                          ),
                        ),
                        const Text(
                          'Email',
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
                          child: TextFormField(
                            initialValue: '1234',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                            readOnly: _isRead,
                            decoration: InputDecoration(
                                suffixIcon: IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () {
                                _isRead = !_isRead;
                              },
                            )),
                          ),
                        ),
                        const Text(
                          'Password',
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
                          child: TextFormField(
                            initialValue: '1234',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                            readOnly: _isRead,
                            decoration: InputDecoration(
                                suffixIcon: IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () {
                                _isRead = !_isRead;
                              },
                            )),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 40),
                          child: const Text(
                            'Confirm password',
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
                    onPressed: () {},
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