class ProductDetailResponse {
  bool success;
  String code;
  ProductDetailData data;

  ProductDetailResponse(
      {required this.success, required this.code, required this.data});

  factory ProductDetailResponse.fromJson(Map<String, dynamic> json) {
    return ProductDetailResponse(
        success: json['success'],
        code: json['code'],
        data: ProductDetailData.fromJson(json['data']));
  }
}

class ProductDetailData {
  int id;
  int sellerId;
  String name;
  String brand;
  int price;
  String description;
  String status;
  ProductCategory category;
  ProductPicture picture;

  ProductDetailData({
    required this.id,
    required this.sellerId,
    required this.name,
    required this.brand,
    required this.price,
    required this.description,
    required this.status,
    required this.category,
    required this.picture,
  });

  factory ProductDetailData.fromJson(Map<String, dynamic> json) {
    return ProductDetailData(
        id: json['id'],
        sellerId: json['seller_id'],
        name: json['name'],
        brand: json['brand'],
        price: json['price'],
        description: json['description'],
        status: json['status'],
        category: ProductCategory.fromJson(json['category']),
        picture: ProductPicture.fromJson(json['picture']));
  }
}

class ProductCategory {
  int id;
  String name;

  ProductCategory({required this.id, required this.name});

  factory ProductCategory.fromJson(Map<String, dynamic> json) {
    return ProductCategory(id: json['id'], name: json['name']);
  }
}

class ProductPicture {
  int id;
  String pictureUrl;

  ProductPicture({
    required this.id,
    required this.pictureUrl,
  });

  factory ProductPicture.fromJson(Map<String, dynamic> json) {
    return ProductPicture(id: json['id'], pictureUrl: json['picture_url']);
  }
}
