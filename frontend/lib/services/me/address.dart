import 'package:chuukohin/constant/environment.dart';
import 'package:chuukohin/models/info_response/info_response.dart';
import 'package:chuukohin/models/response/error/error_response.dart';
import 'package:chuukohin/models/response/me/address/address_response.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddressService {
  static Future<dynamic> addAddress(
      String name,
      String phone,
      String addressLine1,
      String addressLine2,
      String province,
      String district,
      String subDistrict,
      String postalCode) async {
    final prefs = await SharedPreferences.getInstance();
    final String? userToken = prefs.getString('user');
    try {
      Response response = await Dio().post(
          EnvironmentConstant.internalApiPrefix + "/me/address/add",
          data: {
            "name": name,
            'phone': phone,
            'address_line_1': addressLine1,
            'address_line_2': addressLine2,
            'province': province,
            'district': district,
            'sub_district': subDistrict,
            'postal_code': postalCode,
          },
          options: Options(headers: {"Authorization": "Bearer " + userToken!}));
      InfoResponse res = InfoResponse.fromJson(response.data);
      return res;
    } on DioError catch (e) {
      if (e.response?.statusCode == 400 || e.response?.statusCode == 401) {
        ErrorResponse error = ErrorResponse.fromJson(e.response?.data);
        return error;
      }
    }
  }

  static Future<dynamic> editAddress(
      String name,
      String phone,
      String addressLine1,
      String addressLine2,
      String province,
      String district,
      String subDistrict,
      String postalCode) async {
    final prefs = await SharedPreferences.getInstance();
    final String? userToken = prefs.getString('user');
    try {
      Response response = await Dio().patch(
          EnvironmentConstant.internalApiPrefix + "/me/address/edit",
          data: {
            "name": name,
            'phone': phone,
            'address_line_1': addressLine1,
            'address_line_2': addressLine2,
            'province': province,
            'district': district,
            'sub_district': subDistrict,
            'postal_code': postalCode,
          },
          options: Options(headers: {"Authorization": "Bearer " + userToken!}));
      InfoResponse res = InfoResponse.fromJson(response.data);
      return res;
    } on DioError catch (e) {
      if (e.response?.statusCode == 400 || e.response?.statusCode == 401) {
        ErrorResponse error = ErrorResponse.fromJson(e.response?.data);
        return error;
      }
    }
  }

  static Future<dynamic> getAddress() async {
    final prefs = await SharedPreferences.getInstance();
    final String? userToken = prefs.getString('user');
    try {
      Response response = await Dio().get(
          EnvironmentConstant.internalApiPrefix + "/me/address/info",
          options: Options(headers: {"Authorization": "Bearer " + userToken!}));
      AddressInfoResponse res = AddressInfoResponse.fromJson(response.data);
      return res;
    } on DioError catch (e) {
      if (e.response?.statusCode == 400 || e.response?.statusCode == 401) {
        ErrorResponse error = ErrorResponse.fromJson(e.response?.data);
        return error;
      }
    }
  }
}
