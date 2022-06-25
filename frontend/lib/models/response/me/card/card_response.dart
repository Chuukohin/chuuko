class CardInfoResponse {
  bool success;
  String code;
  CardInfoData data;

  CardInfoResponse(
      {required this.success, required this.code, required this.data});

  factory CardInfoResponse.fromJson(Map<String, dynamic> json) {
    return CardInfoResponse(
        success: json['success'],
        code: json['code'],
        data: CardInfoData.fromJson(json['data']));
  }
}

class CardInfoData {
  String name;
  String cardNo;
  String monthExpire;
  String yearExpire;

  CardInfoData(
      {required this.name,
      required this.cardNo,
      required this.monthExpire,
      required this.yearExpire});

  factory CardInfoData.fromJson(Map<String, dynamic> json) {
    return CardInfoData(
        name: json['name'] ?? "",
        cardNo: json['card_no'] ?? "",
        monthExpire: json['month_expire'] ?? "",
        yearExpire: json['year_expire'] ?? "");
  }
}
