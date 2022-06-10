import 'package:chuukohin/constant/theme.dart';
import 'package:chuukohin/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CreateProductScreen extends StatefulWidget {
  const CreateProductScreen({Key? key}) : super(key: key);

  @override
  State<CreateProductScreen> createState() => _CreateProductScreenState();
}

class _CreateProductScreenState extends State<CreateProductScreen> {
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("Men"), value: "Men"),
      DropdownMenuItem(child: Text("Woman"), value: "Woman"),
      DropdownMenuItem(child: Text("Tops"), value: "Tops"),
      DropdownMenuItem(child: Text("Bottoms"), value: "Bottoms"),
      DropdownMenuItem(child: Text("Shoes"), value: "Shoes"),
      DropdownMenuItem(child: Text("Innerwear"), value: "Innerwear"),
      DropdownMenuItem(child: Text("Sport"), value: "Sport"),
      DropdownMenuItem(child: Text("Accessories"), value: "Accessories"),
    ];
    return menuItems;
  }

  String selectedValue = "Men";

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
        appBar: CupertinoNavigationBar(
          middle: const Text('Create an item'),
          leading: GestureDetector(
            child: Row(
              children: [
                Icon(
                  CupertinoIcons.back,
                  color: Color(0xff007AFF),
                ),
                Text(
                  'Back',
                  style: TextStyle(color: Color(0xff007AFF)),
                )
              ],
            ),
            onTap: () {
              Navigator.pushNamed(context, '/me');
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.only(top: 16, left: 30, right: 30, bottom: 20),
            child: Center(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 18),
                      child: Text(
                        'Add your product images',
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 8),
                            child: Text(
                              'Name of product',
                              style: TextStyle(
                                color: ThemeConstant.textSecondaryColor,
                              ),
                            ),
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Name',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: BorderSide(
                                  color: ThemeConstant.primaryColor,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: ThemeConstant.primaryColor,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 8),
                            child: Text(
                              'Price',
                              style: TextStyle(
                                color: ThemeConstant.textSecondaryColor,
                              ),
                            ),
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Price',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: BorderSide(
                                  color: ThemeConstant.primaryColor,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: ThemeConstant.primaryColor,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 8),
                            child: Text(
                              'Brand',
                              style: TextStyle(
                                color: ThemeConstant.textSecondaryColor,
                              ),
                            ),
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Brand',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: BorderSide(
                                  color: ThemeConstant.primaryColor,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: ThemeConstant.primaryColor,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 8),
                            child: Text(
                              'Catecory',
                              style: TextStyle(
                                color: ThemeConstant.textSecondaryColor,
                              ),
                            ),
                          ),
                          DropdownButtonFormField(
                            items: dropdownItems,
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedValue = newValue!;
                              });
                            },
                            style: TextStyle(color: ThemeConstant.primaryColor),
                            dropdownColor: Colors.white,
                            decoration: InputDecoration(
                              hintText: 'Catecory',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: BorderSide(
                                  color: ThemeConstant.primaryColor,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: ThemeConstant.primaryColor,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 8),
                            child: Text(
                              'Description of product',
                              style: TextStyle(
                                color: ThemeConstant.textSecondaryColor,
                              ),
                            ),
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Description',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: BorderSide(
                                  color: ThemeConstant.primaryColor,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: ThemeConstant.primaryColor,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.only(top: 30),
                        child: const MainButton('Next', 50, 300, '/preview'))
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}