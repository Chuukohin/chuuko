import 'package:chuukohin/models/response/me/me_response.dart';
import 'package:flutter/foundation.dart';

class ProfileProvider with ChangeNotifier, DiagnosticableTreeMixin {
  MeData medata = MeData(
    email: "",
    firstname: "",
    lastname: "",
    pictureUrl: "",
    joinDate: "",
  );
  void setMeData(MeData data) {
    medata = data;
    notifyListeners();
  }
}
