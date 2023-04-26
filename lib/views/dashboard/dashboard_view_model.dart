import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neeleez_flutter_app/api/apiRepository.dart';
import 'package:neeleez_flutter_app/components/dailogs/logout_popup.dart';
import 'package:neeleez_flutter_app/config/pref_constant.dart';
import 'package:neeleez_flutter_app/config/preference.dart';
import 'package:neeleez_flutter_app/config/url.dart';
import 'package:neeleez_flutter_app/models/user_data.dart';
import 'package:neeleez_flutter_app/views/notifications/notifications_view.dart';
import 'package:stacked/stacked.dart';

import '../../components/dailogs/language_popup.dart';

class DashboardViewModel extends BaseViewModel {
  //get
  UserData? get user => userData;
  Map? get lang => languageObj;

  // object
  UserData? userData;
  Map? languageObj;

  DashboardViewModel({this.userData}) {
    loadItems();
  }

  // Add ViewModel specific code here
  Future<void> loadItems() async {
    setBusy(true);
    userData = await getUserData();
    languageObj = await getLanguage();
    // userData ??= await getUserData();
    // languageObj ??= await getLanguage();
    setBusy(false);
    notifyListeners();
  }

  void setUserData(UserData? user) {
    userData = user;
    notifyListeners();
  }

  void onDrawerItemTap(context, Map obj) {
    if (obj['id'] == 15) {
      logoutPopup(context);
    } else {
      if (obj['route'].runtimeType != String) {
        Widget hh = obj['route'] as Widget;
        Get.to(() => hh);
      }
    }
  }

  void onNotificationTap() {
    Get.to(() => NotificationsView());
  }

  Future onLanguageTap(_) async {
    return languagePopup(
      _,
      onTap: (obj) async {
        await SharedPreferenceHelper.setString(Preferences.languageSelected, jsonEncode(obj));
        Get.updateLocale(Locale("${obj!["language_code"]}", "${obj["country_code"]}"));
        Get.back();
        loadItems();
        notifyListeners();
      },
    );
  }
}

Future<Map?> getLanguage() async {
  String? language = SharedPreferenceHelper.getString(Preferences.languageSelected);
  if (language != 'N/A') {
    Map obj = await json.decode(language!);
    obj['local'] = Locale("${obj['language_code']}", "${obj['country_code']}");
    return obj;
  }
  return null;
}

Future<UserData?> getUserData() async {
  String? id = SharedPreferenceHelper.getString(Preferences.userId);
  final res = await apiRepository.apiGet(url: '${Url.customerById}/$id');
  if (res != null) {
    UserData? data = UserData.fromJson(res);
    log(data.customerImage!.imageFileName!);
    return data;
  } else {
    return null;
  }
}
