import 'package:chuukohin/constant/environment.dart';
import 'package:chuukohin/models/info_response/info_response.dart';
import 'package:chuukohin/models/response/error/error_response.dart';
import 'package:chuukohin/models/response/order/order_before_create_response.dart';
import 'package:chuukohin/models/response/order/order_detail_response.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderService {
  static Future<dynamic> createOrder(int productId) async {
    final prefs = await SharedPreferences.getInstance();
    final String? userToken = prefs.getString('user');
    try {
      Response response = await Dio().post(
          EnvironmentConstant.internalApiPrefix + "/order/create",
          data: {
            "product_id": productId,
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

  static Future<dynamic> getInfoBeforeCreateOrder(int productId) async {
    final prefs = await SharedPreferences.getInstance();
    final String? userToken = prefs.getString('user');
    try {
      Response response = await Dio().post(
          EnvironmentConstant.internalApiPrefix +
              "/order/info/" +
              productId.toString(),
          options: Options(headers: {"Authorization": "Bearer " + userToken!}));
      OrderBeforeCreateResponse res =
          OrderBeforeCreateResponse.fromJson(response.data);
      return res;
    } on DioError catch (e) {
      if (e.response?.statusCode == 400 || e.response?.statusCode == 401) {
        ErrorResponse error = ErrorResponse.fromJson(e.response?.data);
        return error;
      }
    }
  }

  static Future<dynamic> getOrderDetail(int orderId) async {
    final prefs = await SharedPreferences.getInstance();
    final String? userToken = prefs.getString('user');
    try {
      Response response = await Dio().post(
          EnvironmentConstant.internalApiPrefix +
              "/order/detail/" +
              orderId.toString(),
          options: Options(headers: {"Authorization": "Bearer " + userToken!}));
      OrderDetailResponse res = OrderDetailResponse.fromJson(response.data);
      return res;
    } on DioError catch (e) {
      if (e.response?.statusCode == 400 || e.response?.statusCode == 401) {
        ErrorResponse error = ErrorResponse.fromJson(e.response?.data);
        return error;
      }
    }
  }
}
