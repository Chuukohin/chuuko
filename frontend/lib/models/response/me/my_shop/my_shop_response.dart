import 'package:chuukohin/models/response/product/product_info.dart';

class MyShopInfoResponse {
  bool success;
  String code;
  MyShopInfoData data;

  MyShopInfoResponse(
      {required this.success, required this.code, required this.data});

  factory MyShopInfoResponse.fromJson(Map<String, dynamic> json) {
    return MyShopInfoResponse(
        success: json['success'],
        code: json['code'],
        data: MyShopInfoData.fromJson(json['data']));
  }
}

class MyShopInfoData {
  MyShopInfo seller;
  List<Product> products;

  MyShopInfoData({
    required this.seller,
    required this.products,
  });

  factory MyShopInfoData.fromJson(Map<String, dynamic> json) {
    var myShopProducts =
        json['products'] != null ? json['products'] as List : [];
    if (myShopProducts.isEmpty) {
      return MyShopInfoData(
          seller: MyShopInfo.fromJson(json['seller']), products: []);
    }
    List<Product> myShopProductsList =
        myShopProducts.map((e) => Product.fromJson(e)).toList();
    return MyShopInfoData(
        seller: MyShopInfo.fromJson(json['seller']),
        products: myShopProductsList);
  }
}

class MyShopInfo {
  String name;
  int totalProduct;
  String joinDate;

  MyShopInfo(
      {required this.name, required this.totalProduct, required this.joinDate});

  factory MyShopInfo.fromJson(Map<String, dynamic> json) {
    return MyShopInfo(
        name: json['name'] ?? "",
        totalProduct: json['total_product'] ?? 0,
        joinDate: json['join_date'] ?? "");
  }
}
