import 'package:chuukohin/constant/environment.dart';
import 'package:chuukohin/models/response/account/account_response.dart';
import 'package:chuukohin/models/response/error/error_response.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
}
