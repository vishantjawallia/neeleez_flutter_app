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

  void loadItem(GeneralInformation? genInfo) {
    data = genInfo;
  }
}
