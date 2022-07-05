import 'package:chuukohin/models/response/product/product_info.dart';

class HomeProductResponse {
  bool success;
  String code;
  List<Product> products;

  HomeProductResponse(
      {required this.success, required this.code, required this.products});

  factory HomeProductResponse.fromJson(Map<String, dynamic> json) {
    var homeProducts = json['data'] != null ? json['data'] as List : [];
    if (homeProducts.isEmpty) {
      return HomeProductResponse(
          success: json['seller'], code: json['code'], products: []);
    }
    List<Product> homeProductList =
        homeProducts.map((e) => Product.fromJson(e)).toList();
    return HomeProductResponse(
        success: json['success'],
        code: json['code'],
        products: homeProductList);
  }
}

class CategoryProductResponse {
  bool success;
  String code;
  List<Product> products;

  CategoryProductResponse(
      {required this.success, required this.code, required this.products});

  factory CategoryProductResponse.fromJson(Map<String, dynamic> json) {
    var products = json['data'] != null ? json['data'] as List : [];
    if (products.isEmpty) {
      return CategoryProductResponse(
          success: json['seller'], code: json['code'], products: []);
    }
    List<Product> categoryProductList =
        products.map((e) => Product.fromJson(e)).toList();
    return CategoryProductResponse(
        success: json['success'],
        code: json['code'],
        products: categoryProductList);
  }
}
