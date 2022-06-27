class SellerRegisterResponse {
  bool success;
  String code;
  SellerRegisterData data;

  SellerRegisterResponse(
      {required this.success, required this.code, required this.data});

  factory SellerRegisterResponse.fromJson(Map<String, dynamic> json) {
    return SellerRegisterResponse(
        success: json['success'],
        code: json['code'],
        data: SellerRegisterData.fromJson(json['data']));
  }
}

class SellerRegisterData {
  String token;
  SellerRegisterData({required this.token});

  factory SellerRegisterData.fromJson(Map<String, dynamic> json) {
    return SellerRegisterData(
      token: json['new_token'],
    );
  }
}
