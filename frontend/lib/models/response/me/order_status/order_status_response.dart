class OrderStatusResponse {
  bool success;
  String code;
  List<OrderStatusData> data;

  OrderStatusResponse(
      {required this.success, required this.code, required this.data});

  factory OrderStatusResponse.fromJson(Map<String, dynamic> json) {
    var productList = json['data'] != null ? json['data'] as List : [];
    if (productList.isEmpty) {
      return OrderStatusResponse(
          success: json['success'], code: json['code'], data: []);
    }
    List<OrderStatusData> tempList =
        productList.map((e) => OrderStatusData.fromJson(e)).toList();
    return OrderStatusResponse(
        success: json['success'], code: json['code'], data: tempList);
  }
}

class OrderStatusData {
  int orderId;
  String orderTime;
  int price;
  String productName;
  String productPicture;

  OrderStatusData(
      {required this.orderId,
      required this.orderTime,
      required this.price,
      required this.productName,
      required this.productPicture});

  factory OrderStatusData.fromJson(Map<String, dynamic> json) {
    return OrderStatusData(
        orderId: json['order_id'],
        orderTime: json['order_time'],
        price: json['price'],
        productName: json['product_name'],
        productPicture: json['product_picture']);
  }
}
