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
  List<MyShopProducts> products;

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
    List<MyShopProducts> myShopProductsList =
        myShopProducts.map((e) => MyShopProducts.fromJson(e)).toList();
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
        name: json['name'],
        totalProduct: json['total_product'] ?? 0,
        joinDate: json['join_date']);
  }
}

class MyShopProducts {
  int id;
  String name;
  String price;
  String brand;
  String pictureUrl;

  MyShopProducts(
      {required this.id,
      required this.name,
      required this.price,
      required this.brand,
      required this.pictureUrl});

  factory MyShopProducts.fromJson(Map<String, dynamic> json) {
    return MyShopProducts(
        id: json['id'],
        name: json['name'],
        price: json['price'],
        brand: json['brand'],
        pictureUrl: json['picture_url']);
  }
}
