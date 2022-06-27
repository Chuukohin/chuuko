import 'order_detail_response.dart';

class OrderBeforeCreateResponse {
  bool success;
  String code;
  OrderBeforeCreateData data;

  OrderBeforeCreateResponse(
      {required this.success, required this.code, required this.data});

  factory OrderBeforeCreateResponse.fromJson(Map<String, dynamic> json) {
    return OrderBeforeCreateResponse(
        success: json['success'],
        code: json['code'],
        data: OrderBeforeCreateData.fromJson(json['data']));
  }
}

class OrderBeforeCreateData {
  OrderAddressDetail address;
  OrderCardDetail card;
  OrderProductDetail product;

  OrderBeforeCreateData({
    required this.address,
    required this.card,
    required this.product,
  });

  factory OrderBeforeCreateData.fromJson(Map<String, dynamic> json) {
    return OrderBeforeCreateData(
        address: OrderAddressDetail.fromJson(json['address']),
        card: OrderCardDetail.fromJson(json['card']),
        product: OrderProductDetail.fromJson(json['product']));
  }
}

class OrderCardDetail {
  int id;
  String name;
  String cardNo;
  String monthExpire;
  String yearExpire;

  OrderCardDetail(
      {required this.id,
      required this.name,
      required this.cardNo,
      required this.monthExpire,
      required this.yearExpire});

  factory OrderCardDetail.fromJson(Map<String, dynamic> json) {
    return OrderCardDetail(
        id: json['id'],
        name: json['name'],
        cardNo: json['card_no'],
        monthExpire: json['month_expire'],
        yearExpire: json['year_expire']);
  }
}
