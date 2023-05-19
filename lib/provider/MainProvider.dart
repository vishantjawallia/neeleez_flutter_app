import 'package:flutter/material.dart';
import 'package:neeleez_flutter_app/api/apiRepository.dart';

import '../config/config.dart';
import '../config/pref_constant.dart';
import '../config/preference.dart';
import '../models/user_data.dart';

class MainProvider extends ChangeNotifier {
  UserData? user;

  MainProvider() {
    loadItem();
  }

  void loadItem() async {
    // bool isOnboardingCompleted = SharedPreferenceHelper.getBoolean(Preferences.isOnboardingCompleted);
    // bool isLogged = SharedPreferenceHelper.getBoolean(Preferences.isLogged);
    // String? languageSelected = SharedPreferenceHelper.getString(Preferences.languageSelected);
    // if (languageSelected != "N/A") {
    //   Map dd = await jsonDecode(languageSelected!);
    //   Locale? local = Locale("${dd["language_code"]}", "${dd["country_code"]}");
    //   Get.updateLocale(local);
    // } else {
    //   Map<String, dynamic> obj = {
    //     "iconImage": "https://api.kayyen.com/Uploads/CountryFlag/6d256dbe-c6f2-4b32-923a-ad31d750df8e/noflag.png",
    //     "language_code": "en",
    //     "country_code": "US",
    //   };
    //   await SharedPreferenceHelper.setString(Preferences.languageSelected, jsonEncode(obj));
    //   Get.updateLocale(Locale("${obj["language_code"]}", "${obj["country_code"]}"));
    // }
    // String? customerId = SharedPreferenceHelper.getString(Preferences.companyId);
    String username = SharedPreferenceHelper.getString(Preferences.username) ?? "N/A";
    String password = SharedPreferenceHelper.getString(Preferences.password) ?? "N/A";
    final res = await apiRepository.apiGet('$baseUrl/api/Companies/CompanySignInNew/$username/$password');
    if (res != null) {
      user = UserData.fromJson(res);
      notifyListeners();
    }
  }
}
