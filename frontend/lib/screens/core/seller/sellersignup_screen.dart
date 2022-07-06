import 'package:chuukohin/constant/theme.dart';
import 'package:chuukohin/services/account.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SellerSignupScreen extends StatefulWidget {
  const SellerSignupScreen({Key? key}) : super(key: key);

  @override
  State<SellerSignupScreen> createState() => _SellerSignupState();
}

class _SellerSignupState extends State<SellerSignupScreen> {
  final shopNameController = TextEditingController();
  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();
  final phoneNumController = TextEditingController();
  final addressLine1Controller = TextEditingController();
  final addressLine2Controller = TextEditingController();
  final provinceController = TextEditingController();
  final districtController = TextEditingController();
  final subDistrictController = TextEditingController();
  final postalCodeController = TextEditingController();
  final accountNoController = TextEditingController();
  final bankNameController = TextEditingController();

  void handleRegisterSeller() async {
    await AccountService.registerSeller(
            firstnameController.text,
            lastnameController.text,
            phoneNumController.text,
            shopNameController.text,
            addressLine1Controller.text,
            addressLine2Controller.text,
            provinceController.text,
            districtController.text,
            subDistrictController.text,
            postalCodeController.text,
            accountNoController.text,
            bankNameController.text)
        .then((value) => Navigator.pushReplacementNamed(context, '/home'));
  }

  @override
  void initState() {
    super.initState();
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
                const EdgeInsets.only(top: 16, left: 30, right: 30, bottom: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 8),
                        child: Text(
                          'Shop Name',
                          style: TextStyle(
                            color: ThemeConstant.textSecondaryColor,
                          ),
                        ),
                      ),
                      TextFormField(
                        controller: shopNameController,
                        decoration: InputDecoration(
                          hintText: 'Shop Name',
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
                          'Personal Information',
                          style: TextStyle(
                            color: ThemeConstant.textSecondaryColor,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: TextFormField(
                          controller: firstnameController,
                          decoration: InputDecoration(
                            hintText: 'Firstname',
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
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: TextFormField(
                          controller: lastnameController,
                          decoration: InputDecoration(
                            hintText: 'Lastname',
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
                      ),
                      TextFormField(
                        controller: phoneNumController,
                        keyboardType: TextInputType.phone,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(10),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: InputDecoration(
                          hintText: 'Phone number',
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
                          'Address',
                          style: TextStyle(
                            color: ThemeConstant.textSecondaryColor,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: TextFormField(
                          controller: addressLine1Controller,
                          decoration: InputDecoration(
                            hintText: 'Address Line 1',
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
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: TextFormField(
                          controller: addressLine2Controller,
                          decoration: InputDecoration(
                            hintText: 'Address Line 2',
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
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: TextFormField(
                          controller: provinceController,
                          decoration: InputDecoration(
                            hintText: 'Province',
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
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: TextFormField(
                          controller: districtController,
                          decoration: InputDecoration(
                            hintText: 'District',
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
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: TextFormField(
                          controller: subDistrictController,
                          decoration: InputDecoration(
                            hintText: 'Sub-District',
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
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: TextFormField(
                          controller: postalCodeController,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(5),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: InputDecoration(
                            hintText: 'Postal Code',
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
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 8),
                        child: Text(
                          'Bank Account',
                          style: TextStyle(
                            color: ThemeConstant.textSecondaryColor,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: TextFormField(
                          controller: accountNoController,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(10),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: InputDecoration(
                            hintText: 'Account Number',
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
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: TextFormField(
                          controller: bankNameController,
                          decoration: InputDecoration(
                            hintText: 'Bank Name',
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
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 300,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                    onPressed: () {
                      handleRegisterSeller();
                    },
                    child: const Text(
                      "Register as a seller",
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
