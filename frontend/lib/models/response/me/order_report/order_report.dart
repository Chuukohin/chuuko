class OrderReportResponse {
  bool success;
  String code;
  List<OrderReportData> data;

  OrderReportResponse(
      {required this.success, required this.code, required this.data});

  factory OrderReportResponse.fromJson(Map<String, dynamic> json) {
    var productList = json['data'] != null ? json['data'] as List : [];
    if (productList.isEmpty) {
      return OrderReportResponse(
          success: json['success'], code: json['code'], data: []);
    }
    List<OrderReportData> tempList =
        productList.map((e) => OrderReportData.fromJson(e)).toList();
    return OrderReportResponse(
        success: json['success'], code: json['code'], data: tempList);
  }
}

class OrderReportData {
  int orderId;
  String orderTime;
  String customerName;
  String productPicture;

  OrderReportData(
      {required this.orderId,
      required this.orderTime,
      required this.customerName,
      required this.productPicture});

  factory OrderReportData.fromJson(Map<String, dynamic> json) {
    return OrderReportData(
        orderId: json['order_id'] ?? 0,
        orderTime: json['order_time'] ?? "",
        customerName: json['customer_name'] ?? "",
        productPicture: json['product_picture'] ?? "");
  }
}
