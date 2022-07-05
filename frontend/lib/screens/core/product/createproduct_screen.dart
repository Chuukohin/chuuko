import 'dart:io';

import 'package:chuukohin/constant/theme.dart';
import 'package:chuukohin/models/response/error/error_response.dart';
import 'package:chuukohin/services/product/create_product.dart';
import 'package:chuukohin/services/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class CreateProductScreen extends StatefulWidget {
  const CreateProductScreen({Key? key}) : super(key: key);

  @override
  State<CreateProductScreen> createState() => _CreateProductScreenState();
}

class _CreateProductScreenState extends State<CreateProductScreen> {
  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final brandController = TextEditingController();
  final descriptionController = TextEditingController();

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(child: Text("Men"), value: "11"),
      const DropdownMenuItem(child: Text("Women"), value: "12"),
      const DropdownMenuItem(child: Text("Tops"), value: "13"),
      const DropdownMenuItem(child: Text("Bottoms"), value: "14"),
      const DropdownMenuItem(child: Text("Shoes"), value: "15"),
      const DropdownMenuItem(child: Text("Innerwear"), value: "16"),
      const DropdownMenuItem(child: Text("Sport"), value: "17"),
      const DropdownMenuItem(child: Text("Accessories"), value: "18"),
    ];
    return menuItems;
  }

  String selectedValue = "";
  // ignore: avoid_init_to_null
  File? imagefile = null;
  final ImagePicker _picker = ImagePicker();
  _getFromGallery() async {
    XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        imagefile = File(pickedFile.path);
      });
    }
  }

  void createProduct() async {
    await CreateProductService.createProduct(
            imagefile!,
            brandController.text,
            int.parse(selectedValue),
            descriptionController.text,
            nameController.text,
            int.parse(priceController.text))
        .then((response) {
      if (response is ErrorResponse) {
        var error = SnackBar(
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.only(bottom: 60, left: 15, right: 15),
          content: Text(response.message),
          action: SnackBarAction(
            label: 'OK',
            onPressed: () {},
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(error);
      } else {
        context.read<HomeProvider>().getHomeProduct().then((value) {
          Navigator.pop(context);
        });
      }
    });
  }

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
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.only(top: 16, left: 30, right: 30, bottom: 20),
            child: Center(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        _getFromGallery();
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        child: imagefile != null
                            ? Image.file(
                                imagefile!,
                                width: double.infinity,
                                height: 200,
                                fit: BoxFit.fill,
                              )
                            : Image.asset(
                                'assets/images/product-placeholder.png',
                                width: double.infinity,
                                height: 200,
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 18),
                      child: const Text(
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
                            controller: nameController,
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
                            controller: priceController,
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
                            controller: brandController,
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
                              'Category',
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
                            dropdownColor: Colors.white,
                            decoration: InputDecoration(
                              hintText: 'Category',
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
                            controller: descriptionController,
                            maxLines: 3,
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
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(300, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                        ),
                        onPressed: () {
                          createProduct();
                        },
                        child: const Text(
                          "Publish",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
