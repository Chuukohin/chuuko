import 'package:chuukohin/constant/environment.dart';
import 'package:chuukohin/models/response/account/account_response.dart';
import 'package:chuukohin/models/response/error/error_response.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/response/account/seller_register.dart';

class AccountService {
  static Future<dynamic> login(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    try {
      Response response = await Dio().post(
        EnvironmentConstant.internalApiPrefix + '/account/login',
        data: {
          'email': email,
          'password': password,
        },
      );
      LoginResponse res = LoginResponse.fromJson(response.data);
      await prefs.setString('user', res.data.token);
      return res;
    } on DioError catch (e) {
      if (e.response?.statusCode == 400 || e.response?.statusCode == 401) {
        ErrorResponse error = ErrorResponse.fromJson(e.response?.data);
        return error;
      }
    }
  }

  static Future<dynamic> register(String firstname, String lastname,
      String email, String password, String confirmPassword) async {
    try {
      Response response = await Dio().post(
          EnvironmentConstant.internalApiPrefix + '/account/register',
          data: {
            'firstname': firstname,
            'lastname': lastname,
            'email': email,
            'password': password,
            'confirm_password': confirmPassword,
          });
      LoginResponse res = LoginResponse.fromJson(response.data);
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('user', res.data.token);
      return true;
    } on DioError catch (e) {
      if (e.response?.statusCode == 400 || e.response?.statusCode == 401) {
        ErrorResponse error = ErrorResponse.fromJson(e.response?.data);
        return error;
      }
    }
  }

  static Future<dynamic> registerSeller(
      String firstname,
      String lastname,
      String phone,
      String shopName,
      String shopDescription,
      String addressLine1,
      String addressLine2,
      String province,
      String district,
      String subDistrict,
      String postalCode,
      String accountNo,
      String bankName) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String? userToken = prefs.getString('user');
      Response response = await Dio().post(
          EnvironmentConstant.internalApiPrefix + "account/seller/register",
          data: {
            'firstname': firstname,
            'lastname': lastname,
            'phone': phone,
            'shop_name': shopName,
            'shop_description': shopDescription,
            'address_line1': addressLine1,
            'address_line2': addressLine2,
            'province': province,
            'district': district,
            'sub_district': subDistrict,
            'postal_code': postalCode,
            'account_no': accountNo,
            'bank_name': bankName,
          },
          options: Options(headers: {"Authorization": "Bearer " + userToken!}));

      SellerRegisterResponse res =
          SellerRegisterResponse.fromJson(response.data);
      await prefs.setString('user', res.data.token);
      return true;
    } on DioError catch (e) {
      if (e.response?.statusCode == 400 || e.response?.statusCode == 401) {
        ErrorResponse error = ErrorResponse.fromJson(e.response?.data);
        return error;
      }
    }
  }
}
