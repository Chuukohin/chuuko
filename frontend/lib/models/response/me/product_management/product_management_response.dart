class ProductManagementResponse {
  bool success;
  String code;
  List<ProductManagementData> data;

  ProductManagementResponse(
      {required this.success, required this.code, required this.data});

  factory ProductManagementResponse.fromJson(Map<String, dynamic> json) {
    var productList = json['data'] != null ? json['data'] as List : [];
    if (productList.isEmpty) {
      return ProductManagementResponse(
          success: json['success'], code: json['code'], data: []);
    }
    List<ProductManagementData> tempList =
        productList.map((e) => ProductManagementData.fromJson(e)).toList();
    return ProductManagementResponse(
        success: json['success'], code: json['code'], data: tempList);
  }
}

class ProductManagementData {
  int id;
  String name;
  int price;
  String brand;
  String pictureUrl;

  ProductManagementData(
      {required this.id,
      required this.name,
      required this.price,
      required this.brand,
      required this.pictureUrl});

  factory ProductManagementData.fromJson(Map<String, dynamic> json) {
    return ProductManagementData(
        id: json['id'],
        name: json['token'],
        price: json['price'],
        brand: json['brand'],
        pictureUrl: json['picture_url']);
  }
}
