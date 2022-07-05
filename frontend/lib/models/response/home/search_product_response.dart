import 'package:chuukohin/models/response/product/product_info.dart';

class SearchProductResponse {
  bool success;
  String code;
  List<Product> products;

  SearchProductResponse(
      {required this.success, required this.code, required this.products});

  factory SearchProductResponse.fromJson(Map<String, dynamic> json) {
    var searchList = json['data'] != null ? json['data'] as List : [];
    if (searchList.isEmpty) {
      return SearchProductResponse(
          success: json['success'], code: json['code'], products: []);
    }
    List<Product> searchProductList =
        searchList.map((e) => Product.fromJson(e)).toList();
    return SearchProductResponse(
        success: json['success'],
        code: json['code'],
        products: searchProductList);
  }
}
