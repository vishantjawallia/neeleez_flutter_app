// ignore_for_file: unused_local_variable

import 'dart:convert';
import 'dart:developer';

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
    final res = await apiRepository.apiGet(url: Url.countryInfo);
    try {
      if (res != null) {
        CountryInfo info = CountryInfo.fromJson(res);
        await SharedPreferenceHelper.setString(Preferences.countryInfo, jsonEncode(res));
        bool isOnboardingCompleted = SharedPreferenceHelper.getBoolean(Preferences.isOnboardingCompleted);
        bool isLogged = SharedPreferenceHelper.getBoolean(Preferences.isLogged);
        String? customerId = SharedPreferenceHelper.getString(Preferences.customerId);
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
