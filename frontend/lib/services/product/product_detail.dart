import 'package:chuukohin/constant/environment.dart';
import 'package:chuukohin/models/response/error/error_response.dart';
import 'package:chuukohin/models/response/product/product_detail_response.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductDetailService {
  static Future<dynamic> getProductDetail(String id) async {
    final prefs = await SharedPreferences.getInstance();
    final String? userToken = prefs.getString('user');
    try {
      Response response = await Dio().get(
          EnvironmentConstant.internalApiPrefix + "/product/info/" + id,
          options: Options(headers: {"Authorization": "Bearer " + userToken!}));
      ProductDetailResponse res = ProductDetailResponse.fromJson(response.data);
      return res;
    } on DioError catch (e) {
      if (e.response?.statusCode == 400 || e.response?.statusCode == 401) {
        ErrorResponse error = ErrorResponse.fromJson(e.response?.data);
        return error;
      }
    }
  }
}
