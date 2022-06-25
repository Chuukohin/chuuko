import 'package:chuukohin/models/response/me/card/card_response.dart';
import 'package:chuukohin/models/response/me/me_response.dart';
import 'package:flutter/foundation.dart';

class ProfileProvider with ChangeNotifier, DiagnosticableTreeMixin {
  MeData medata = MeData(
      email: "", firstname: "", lastname: "", pictureUrl: "", joinDate: "");
  CardInfoData cardInfo =
      CardInfoData(name: "", cardNo: "", monthExpire: "", yearExpire: "");
  void setMeData(MeData data) {
    medata = data;
    notifyListeners();
  }

  void setCardInfo(CardInfoData data) {
    cardInfo = data;
    notifyListeners();
  }
}
