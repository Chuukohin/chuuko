class MeResponse {
  bool success;
  String code;
  MeData data;

  MeResponse({required this.success, required this.code, required this.data});

  factory MeResponse.fromJson(Map<String, dynamic> json) {
    return MeResponse(
        success: json['success'],
        code: json['code'],
        data: MeData.fromJson(json['data']));
  }
}

class MeData {
  String email;
  String firstname;
  String lastname;
  String pictureUrl;
  String joinDate;

  MeData({
    required this.email,
    required this.firstname,
    required this.lastname,
    required this.pictureUrl,
    required this.joinDate,
  });

  factory MeData.fromJson(Map<String, dynamic> json) {
    return MeData(
        email: json['email'],
        firstname: json['firstname'],
        lastname: json['lastname'],
        pictureUrl: json['picture_url'],
        joinDate: json['join_date']);
  }
}
