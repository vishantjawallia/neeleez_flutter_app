// ignore_for_file: unused_local_variable

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neeleez_flutter_app/api/apiRepository.dart';
import 'package:neeleez_flutter_app/config/pref_constant.dart';
import 'package:neeleez_flutter_app/config/preference.dart';
import 'package:neeleez_flutter_app/config/url.dart';
import 'package:neeleez_flutter_app/models/country_info.dart';
import 'package:neeleez_flutter_app/views/dashboard/dashboard_view.dart';
import 'package:stacked/stacked.dart';

import '../login/login_view.dart';
import '../on_boarding_1/on_boarding_1_view.dart';

class SplashViewModel extends BaseViewModel {
  SplashViewModel();
  // loadItems();

  /* loaders-items */
  void loadItems(context) async {
    final res = await apiRepository.apiGet(Url.countryInfo);
    log(res.toString());
    try {
      if (res != null) {
        CountryInfo info = CountryInfo.fromJson(res);
        await SharedPreferenceHelper.setString(Preferences.countryInfo, jsonEncode(res));
        bool isOnboardingCompleted = SharedPreferenceHelper.getBoolean(Preferences.isOnboardingCompleted);
        bool isLogged = SharedPreferenceHelper.getBoolean(Preferences.isLogged);
        String? languageSelected = SharedPreferenceHelper.getString(Preferences.languageSelected);
        if (languageSelected != "N/A") {
          Map dd = await json.decode(languageSelected!);
          Locale? local = Locale("${dd["language_code"]}", "${dd["country_code"]}");
          Get.updateLocale(local);
        } else {
          Map<String, dynamic> obj = {
            "iconImage": "https://api.kayyen.com/Uploads/CountryFlag/6d256dbe-c6f2-4b32-923a-ad31d750df8e/noflag.png",
            "language_code": "en",
            "country_code": "US",
          };
          await SharedPreferenceHelper.setString(Preferences.languageSelected, jsonEncode(obj));
          Get.updateLocale(Locale("${obj["language_code"]}", "${obj["country_code"]}"));
        }
        String? customerId = SharedPreferenceHelper.getString(Preferences.companyId);
        if (isLogged && customerId != "N/A") {
          Get.off(() => const DashboardView(), transition: Transition.native);
        } else if (isOnboardingCompleted) {
          Get.off(() => const LoginView());
        } else {
          Get.off(() => const OnBoarding1View());
        }
        log("==========>${Get.locale!.toLanguageTag()}");
        log("isOnboardingCompleted==========>$isOnboardingCompleted");
      }
    } catch (e) {
      log("=========>splash error: $e");
    }
  }
}
