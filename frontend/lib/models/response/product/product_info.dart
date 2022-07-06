class Product {
  int id;
  String name;
  int price;
  String brand;
  String pictureUrl;

  Product(
      {required this.id,
      required this.name,
      required this.price,
      required this.brand,
      required this.pictureUrl});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        id: json['id'],
        name: json['name'],
        price: json['price'],
        brand: json['brand'],
        pictureUrl: json['picture_url']);
  }
}
