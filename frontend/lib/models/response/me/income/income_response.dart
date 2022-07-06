class IncomeInfoResponse {
  bool success;
  String code;
  IncomeInfoData data;

  IncomeInfoResponse(
      {required this.success, required this.code, required this.data});

  factory IncomeInfoResponse.fromJson(Map<String, dynamic> json) {
    return IncomeInfoResponse(
        success: json['success'],
        code: json['code'],
        data: IncomeInfoData.fromJson(json['data']));
  }
}

class IncomeInfoData {
  IncomeSummary summary;
  List<IncomeOrder> orderList;

  IncomeInfoData({
    required this.summary,
    required this.orderList,
  });

  factory IncomeInfoData.fromJson(Map<String, dynamic> json) {
    var incomeOrderList =
        json['order_list'] != null ? json['order_list'] as List : [];
    if (incomeOrderList.isEmpty) {
      return IncomeInfoData(
          summary: IncomeSummary.fromJson(json['summary']), orderList: []);
    }
    List<IncomeOrder> incomeOrderListList =
        incomeOrderList.map((e) => IncomeOrder.fromJson(e)).toList();
    return IncomeInfoData(
        summary: IncomeSummary.fromJson(json['summary']),
        orderList: incomeOrderListList);
  }
}

class IncomeSummary {
  String shopName;
  int totalIncome;

  IncomeSummary({required this.shopName, required this.totalIncome});

  factory IncomeSummary.fromJson(Map<String, dynamic> json) {
    return IncomeSummary(
        shopName: json['shop_name'] ?? "",
        totalIncome: json['total_income'] ?? 0);
  }
}

class IncomeOrder {
  String customerName;
  String orderTime;
  int income;

  IncomeOrder(
      {required this.customerName,
      required this.orderTime,
      required this.income});

  factory IncomeOrder.fromJson(Map<String, dynamic> json) {
    return IncomeOrder(
        customerName: json['customer_name'] ?? "",
        orderTime: json['order_time'] ?? "",
        income: json['income'] ?? 0);
  }
}
