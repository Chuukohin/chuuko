import 'package:chuukohin/models/response/me/address/address_response.dart';
import 'package:chuukohin/models/response/me/card/card_response.dart';
import 'package:chuukohin/models/response/me/me_response.dart';
import 'package:chuukohin/models/response/me/my_shop/my_shop_response.dart';
import 'package:chuukohin/services/me/address.dart';
import 'package:chuukohin/services/me/me.dart';
import 'package:flutter/foundation.dart';

class ProfileProvider with ChangeNotifier, DiagnosticableTreeMixin {
  MeData medata = MeData(
      email: "", firstname: "", lastname: "", pictureUrl: "", joinDate: "");
  CardInfoData cardInfo =
      CardInfoData(name: "", cardNo: "", monthExpire: "", yearExpire: "");
  AddressInfoData addressInfo = AddressInfoData(
      name: "",
      phone: "",
      addressLine1: "",
      addressLine2: "",
      province: "",
      district: "",
      subDistrict: "",
      postalCode: "");
  bool addressFirstTime = false;

  void setMeData(MeData data) {
    medata = data;
    notifyListeners();
  }

  void setCardInfo(CardInfoData data) {
    cardInfo = data;
    notifyListeners();
  }

  void setAddressInfo(AddressInfoData data) {
    addressInfo = data;
    notifyListeners();
  }

  Future<void> getMeData() async {
    final meResponse = await ProfileService.getProfile();
    if (meResponse is MeResponse) {
      setMeData(meResponse.data);
    } else {
      setMeData(MeData(
          email: "",
          firstname: "",
          lastname: "",
          pictureUrl: "",
          joinDate: ""));
    }
    notifyListeners();
  }

  Future getAddressInfo() async {
    final response = await AddressService.getAddress();
    if (response is AddressInfoResponse) {
      setAddressInfo(response.data);
    } else {
      setAddressInfo(AddressInfoData(
          name: "",
          phone: "",
          addressLine1: "",
          addressLine2: "",
          province: "",
          district: "",
          subDistrict: "",
          postalCode: ""));
    }
    notifyListeners();
    return response;
  }

  void setAddressFirstTime(bool value) {
    addressFirstTime = value;
    notifyListeners();
  }
}

class SellerProvider with ChangeNotifier, DiagnosticableTreeMixin {
  String sellerId = "";
  MyShopInfoData shopData = MyShopInfoData(
      seller: MyShopInfo(name: "", totalProduct: 0, joinDate: ""),
      products: []);

  void setSellerId(String id) {
    sellerId = id;
    notifyListeners();
  }

  void setShopData(MyShopInfoData data) {
    shopData = data;
    notifyListeners();
  }
}
