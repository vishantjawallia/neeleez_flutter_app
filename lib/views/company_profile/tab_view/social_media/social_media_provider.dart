import 'package:flutter/material.dart';
import 'package:neeleez_flutter_app/models/general_info/general_info.dart';

class SocialMediaProvider extends ChangeNotifier {
  GeneralInformation? data;
  TextEditingController facebook = TextEditingController();
  TextEditingController instagram = TextEditingController();
  TextEditingController linkedIn = TextEditingController();
  TextEditingController twitter = TextEditingController();

  SocialMediaProvider() {
    facebook.addListener(() => notifyListeners());
    instagram.addListener(() => notifyListeners());
    linkedIn.addListener(() => notifyListeners());
    twitter.addListener(() => notifyListeners());
  }

  void loadItem(GeneralInformation? genInfo) async {
    await Future.delayed(const Duration(milliseconds: 100));
    if (genInfo != null) {
      data = genInfo;
      facebook.text = genInfo.socialMediaInfo?.facebook ?? "";
      instagram.text = genInfo.socialMediaInfo?.instagram ?? "";
      linkedIn.text = genInfo.socialMediaInfo?.linkedIn ?? "";
      twitter.text = genInfo.socialMediaInfo?.twitter ?? "";
    }
    notifyListeners();
  }

  void clearAll() {
    data = null;
    facebook.text = "";
    instagram.text = "";
    linkedIn.text = "";
    twitter.text = "";
    notifyListeners();
  }
}
