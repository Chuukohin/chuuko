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
    double screenHeight = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () async => false,
      child: GestureDetector(
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
              padding: EdgeInsets.only(
                  top: screenHeight / 8, left: 30, right: 30, bottom: 20),
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
                              style: TextStyle(fontWeight: FontWeight.bold),
                              readOnly: _isRead,
                              decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                icon: Icon(Icons.edit),
                                onPressed: () {
                                  _isRead = !_isRead;
                                },
                              )),
                            ),
                          ),
                          Text(
                            'Firstname ',
                            style: TextStyle(
                                color: Color(0xffC1C1C1), fontSize: 13),
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
                              style: TextStyle(fontWeight: FontWeight.bold),
                              readOnly: _isRead,
                              decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                icon: Icon(Icons.edit),
                                onPressed: () {
                                  _isRead = !_isRead;
                                },
                              )),
                            ),
                          ),
                          Text(
                            'Lastname ',
                            style: TextStyle(
                                color: Color(0xffC1C1C1), fontSize: 13),
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
                              style: TextStyle(fontWeight: FontWeight.bold),
                              readOnly: _isRead,
                              decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                icon: Icon(Icons.edit),
                                onPressed: () {
                                  _isRead = !_isRead;
                                },
                              )),
                            ),
                          ),
                          Text(
                            'Email',
                            style: TextStyle(
                                color: Color(0xffC1C1C1), fontSize: 13),
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
                              style: TextStyle(fontWeight: FontWeight.bold),
                              readOnly: _isRead,
                              decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                icon: Icon(Icons.edit),
                                onPressed: () {
                                  _isRead = !_isRead;
                                },
                              )),
                            ),
                          ),
                          Text(
                            'Password',
                            style: TextStyle(
                                color: Color(0xffC1C1C1), fontSize: 13),
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
                              style: TextStyle(fontWeight: FontWeight.bold),
                              readOnly: _isRead,
                              decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                icon: Icon(Icons.edit),
                                onPressed: () {
                                  _isRead = !_isRead;
                                },
                              )),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 40),
                            child: Text(
                              'Confirm password',
                              style: TextStyle(
                                  color: Color(0xffC1C1C1), fontSize: 13),
                            ),
                          )
                        ],
                      )),
                  const MainButton('Sign Up', 50, 300, '/Save')
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
