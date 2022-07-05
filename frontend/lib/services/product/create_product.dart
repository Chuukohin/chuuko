import 'dart:io';

import 'package:chuukohin/constant/environment.dart';
import 'package:chuukohin/models/info_response/info_response.dart';
import 'package:chuukohin/models/response/error/error_response.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreateProductService {
  static Future<dynamic> createProduct(File file, String brand, int categoryId,
      String description, String name, int price) async {
    final prefs = await SharedPreferences.getInstance();
    final String? userToken = prefs.getString('user');
    String fileName = file.path.split('/').last;
    FormData formData = FormData.fromMap({
      "image": await MultipartFile.fromFile(file.path, filename: fileName),
      "brand": brand,
      "category_id": categoryId,
      "description": description,
      "name": name,
      "price": price,
    });
    try {
      Response response = await Dio().post(
          EnvironmentConstant.internalApiPrefix + "/product/add",
          data: formData,
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
}
