class AddressInfoResponse {
  bool success;
  String code;
  AddressInfoData data;

  AddressInfoResponse(
      {required this.success, required this.code, required this.data});

  factory AddressInfoResponse.fromJson(Map<String, dynamic> json) {
    return AddressInfoResponse(
        success: json['success'],
        code: json['code'],
        data: AddressInfoData.fromJson(json['data']));
  }
}

class AddressInfoData {
  String name;
  String phone;
  String addressLine1;
  String addressLine2;
  String province;
  String district;
  String subDistrict;
  String postalCode;

  AddressInfoData({
    required this.name,
    required this.phone,
    required this.addressLine1,
    required this.addressLine2,
    required this.province,
    required this.district,
    required this.subDistrict,
    required this.postalCode,
  });

  factory AddressInfoData.fromJson(Map<String, dynamic> json) {
    return AddressInfoData(
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
