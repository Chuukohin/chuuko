class OrderDetailResponse {
  bool success;
  String code;
  OrderDetailData data;

  OrderDetailResponse(
      {required this.success, required this.code, required this.data});

  factory OrderDetailResponse.fromJson(Map<String, dynamic> json) {
    return OrderDetailResponse(
        success: json['success'],
        code: json['code'],
        data: OrderDetailData.fromJson(json['data']));
  }
}

class OrderDetailData {
  OrderProductDetail product;
  OrderAddressDetail address;
  OrderDetails orderDetail;
  OrderDeliveryInfoDetail deliveryInfo;
  OrderTrackingDetail trackingOrder;

  OrderDetailData({
    required this.product,
    required this.address,
    required this.orderDetail,
    required this.deliveryInfo,
    required this.trackingOrder,
  });

  factory OrderDetailData.fromJson(Map<String, dynamic> json) {
    return OrderDetailData(
        product: OrderProductDetail.fromJson(json['product']),
        address: OrderAddressDetail.fromJson(json['address']),
        orderDetail: OrderDetails.fromJson(json['order_detail']),
        deliveryInfo: OrderDeliveryInfoDetail.fromJson(json['delivery_info']),
        trackingOrder: OrderTrackingDetail.fromJson(json['tracking_order']));
  }
}

class OrderAddressDetail {
  int id;
  String name;
  String phone;
  String addressLine1;
  String addressLine2;
  String province;
  String district;
  String subDistrict;
  String postalCode;

  OrderAddressDetail({
    required this.id,
    required this.name,
    required this.phone,
    required this.addressLine1,
    required this.addressLine2,
    required this.province,
    required this.district,
    required this.subDistrict,
    required this.postalCode,
  });

  factory OrderAddressDetail.fromJson(Map<String, dynamic> json) {
    return OrderAddressDetail(
        id: json['id'],
        name: json['name'],
        phone: json['phone'],
        addressLine1: json['address_line_1'],
        addressLine2: json['address_line_2'] ?? "",
        province: json['province'],
        district: json['district'],
        subDistrict: json['sub_district'],
        postalCode: json['postal_code']);
  }
}

class OrderDeliveryInfoDetail {
  String trackingNumber;

  OrderDeliveryInfoDetail({required this.trackingNumber});

  factory OrderDeliveryInfoDetail.fromJson(Map<String, dynamic> json) {
    return OrderDeliveryInfoDetail(trackingNumber: json['tracking_number']);
  }
}

class OrderDetails {
  String customerName;
  int orderId;
  String orderTime;
  int price;

  OrderDetails({
    required this.customerName,
    required this.orderId,
    required this.orderTime,
    required this.price,
  });

  factory OrderDetails.fromJson(Map<String, dynamic> json) {
    return OrderDetails(
        customerName: json['customer_name'],
        orderId: json['order_id'],
        orderTime: json['order_time'],
        price: json['price']);
  }
}

class OrderProductDetail {
  int id;
  String name;
  int price;
  String brand;
  String pictureUrl;

  OrderProductDetail(
      {required this.id,
      required this.name,
      required this.price,
      required this.brand,
      required this.pictureUrl});

  factory OrderProductDetail.fromJson(Map<String, dynamic> json) {
    return OrderProductDetail(
        id: json['id'],
        name: json['name'],
        price: json['price'],
        brand: json['brand'],
        pictureUrl: json['picture_url']);
  }
}

class OrderTrackingDetail {
  int productId;
  String trackingNumber;
  List<OrderTrackingStatusDetail> status;

  OrderTrackingDetail({
    required this.productId,
    required this.trackingNumber,
    required this.status,
  });

  factory OrderTrackingDetail.fromJson(Map<String, dynamic> json) {
    var trackingStatus = json['status'] != null ? json['status'] as List : [];
    if (trackingStatus.isEmpty) {
      return OrderTrackingDetail(
          productId: json['product_id'],
          trackingNumber: json['tracking_number'],
          status: []);
    }
    List<OrderTrackingStatusDetail> trackingStatusList = trackingStatus
        .map((e) => OrderTrackingStatusDetail.fromJson(e))
        .toList();
    return OrderTrackingDetail(
      productId: json['product_id'],
      trackingNumber: json['tracking_number'],
      status: trackingStatusList,
    );
  }
}

class OrderTrackingStatusDetail {
  String status;
  String time;
  String description;

  OrderTrackingStatusDetail(
      {required this.status, required this.time, required this.description});

  factory OrderTrackingStatusDetail.fromJson(Map<String, dynamic> json) {
    return OrderTrackingStatusDetail(
        status: json['status'],
        time: json['time'],
        description: json['description'] ?? "");
  }
}
