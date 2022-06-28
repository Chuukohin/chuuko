import 'package:chuukohin/services/me/address.dart';
import 'package:chuukohin/services/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:chuukohin/widgets/me/textform.dart';
import 'package:provider/provider.dart';

class MyAddressScreen extends StatefulWidget {
  const MyAddressScreen({Key? key}) : super(key: key);

  @override
  State<MyAddressScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<MyAddressScreen> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final addressLine1Controller = TextEditingController();
  final addressLine2Controller = TextEditingController();
  final provinceController = TextEditingController();
  final districtController = TextEditingController();
  final subDistrictController = TextEditingController();
  final postalCodeController = TextEditingController();

  void handleUpdateAddress() async {
    if (Provider.of<ProfileProvider>(context, listen: false).addressFirstTime) {
      await AddressService.addAddress(
          nameController.text,
          phoneController.text,
          addressLine1Controller.text,
          addressLine2Controller.text,
          provinceController.text,
          districtController.text,
          subDistrictController.text,
          postalCodeController.text);
      context.read<ProfileProvider>().getAddressInfo().then(
            (value) => Navigator.pop(context),
          );
    } else {
      await AddressService.editAddress(
          nameController.text,
          phoneController.text,
          addressLine1Controller.text,
          addressLine2Controller.text,
          provinceController.text,
          districtController.text,
          subDistrictController.text,
          postalCodeController.text);
      context.read<ProfileProvider>().getAddressInfo().then(
            (value) => Navigator.pop(context),
          );
    }
  }

  @override
  void initState() {
    super.initState();
    nameController.text = context.read<ProfileProvider>().addressInfo.name;
    phoneController.text = context.read<ProfileProvider>().addressInfo.phone;
    addressLine1Controller.text =
        context.read<ProfileProvider>().addressInfo.addressLine1;
    addressLine2Controller.text =
        context.read<ProfileProvider>().addressInfo.addressLine2;
    provinceController.text =
        context.read<ProfileProvider>().addressInfo.province;
    districtController.text =
        context.read<ProfileProvider>().addressInfo.district;
    subDistrictController.text =
        context.read<ProfileProvider>().addressInfo.subDistrict;
    postalCodeController.text =
        context.read<ProfileProvider>().addressInfo.postalCode;
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
          title: const Text('My adress'),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding:
                const EdgeInsets.only(top: 10, left: 30, right: 30, bottom: 30),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 5),
                      child: TextForm(
                        controller: nameController,
                        title: 'Firstname - Lastname',
                        subtitle: 'Fullname',
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        margin: const EdgeInsets.only(bottom: 25),
                        child: TextForm(
                          controller: phoneController,
                          title: 'Phone number',
                          subtitle: 'Phone number',
                        )),
                  ],
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 5),
                    child: const Text(
                      'My Address',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 5),
                      child: TextForm(
                        controller: addressLine1Controller,
                        title: 'Address',
                        subtitle: 'Address',
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 5),
                      child: TextForm(
                        controller: addressLine2Controller,
                        title: 'Address (Optional)',
                        subtitle: 'Address (Optional)',
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        margin: const EdgeInsets.only(bottom: 5),
                        child: TextForm(
                          controller: provinceController,
                          title: 'Province',
                          subtitle: 'Province',
                        )),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        margin: const EdgeInsets.only(bottom: 5),
                        child: TextForm(
                          controller: districtController,
                          title: 'District',
                          subtitle: 'District',
                        )),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        margin: const EdgeInsets.only(bottom: 5),
                        child: TextForm(
                          controller: subDistrictController,
                          title: 'Sub District',
                          subtitle: 'Sub District',
                        )),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        margin: const EdgeInsets.only(bottom: 40),
                        child: TextForm(
                          controller: postalCodeController,
                          title: 'Postal Code',
                          subtitle: 'Postal Code',
                        )),
                  ],
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
                      handleUpdateAddress();
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
