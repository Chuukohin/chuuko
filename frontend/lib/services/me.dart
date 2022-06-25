import 'package:chuukohin/constant/environment.dart';
import 'package:chuukohin/models/response/error/error_response.dart';
import 'package:chuukohin/models/response/me/me_response.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileService {
  static Future<dynamic> getProfile() async {
    final prefs = await SharedPreferences.getInstance();
    final String? userToken = prefs.getString('user');
    try {
      Response response = await Dio().get(
          EnvironmentConstant.internalApiPrefix + "/me/profile/info",
          options: Options(headers: {"Authorization": "Bearer " + userToken!}));
      MeResponse res = MeResponse.fromJson(response.data);
      return res;
    } on DioError catch (e) {
      if (e.response?.statusCode == 400 || e.response?.statusCode == 401) {
        ErrorResponse error = ErrorResponse.fromJson(e.response?.data);
        return error;
      }
    }
  }
}
