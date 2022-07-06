import 'package:chuukohin/constant/environment.dart';
import 'package:chuukohin/models/response/error/error_response.dart';
import 'package:chuukohin/models/response/home/home_product_response.dart';
import 'package:chuukohin/models/response/home/search_product_response.dart';
import 'package:dio/dio.dart';

class HomeService {
  static Future<dynamic> getHomeProduct() async {
    try {
      Response response = await Dio().get(
        EnvironmentConstant.internalApiPrefix + "/home/all",
      );
      HomeProductResponse res = HomeProductResponse.fromJson(response.data);
      return res;
    } on DioError catch (e) {
      if (e.response?.statusCode == 400 || e.response?.statusCode == 401) {
        ErrorResponse error = ErrorResponse.fromJson(e.response?.data);
        return error;
      }
    }
  }

  static Future<dynamic> getCategoryProduct(String id) async {
    try {
      Response response = await Dio().get(
        EnvironmentConstant.internalApiPrefix + "/home/category/" + id,
      );
      CategoryProductResponse res =
          CategoryProductResponse.fromJson(response.data);
      return res;
    } on DioError catch (e) {
      if (e.response?.statusCode == 400 || e.response?.statusCode == 401) {
        ErrorResponse error = ErrorResponse.fromJson(e.response?.data);
        return error;
      }
    }
  }

  static Future<dynamic> searchProduct(String name) async {
    try {
      Response response = await Dio().get(
        EnvironmentConstant.internalApiPrefix + "/home/search?value=" + name,
      );
      SearchProductResponse res = SearchProductResponse.fromJson(response.data);
      return res;
    } on DioError catch (e) {
      if (e.response?.statusCode == 400 || e.response?.statusCode == 401) {
        ErrorResponse error = ErrorResponse.fromJson(e.response?.data);
        return error;
      }
    }
  }
}
