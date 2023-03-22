// ignore_for_file: unused_local_variable

import 'dart:convert';

import 'package:get/get.dart';
import 'package:neeleez_flutter_app/api/apiRepository.dart';
import 'package:neeleez_flutter_app/config/pref_constant.dart';
import 'package:neeleez_flutter_app/config/preference.dart';
import 'package:neeleez_flutter_app/config/url.dart';
import 'package:neeleez_flutter_app/models/country_info.dart';
import 'package:neeleez_flutter_app/views/on_boarding_1/on_boarding_1_view.dart';
import 'package:stacked/stacked.dart';

class SplashViewModel extends BaseViewModel {
  SplashViewModel() {
    loadItems();
  }

  
  /* loaders-items */
  Future<void> loadItems() async {
    Future.delayed(const Duration(seconds: 3), () async {
      try {
        final res = await apiRepository.apiGet(Url.countryInfo);
        if (res != null) {
          CountryInfo info = CountryInfo.fromJson(res);
          SharedPreferenceHelper.setString(Preferences.countryInfo, jsonEncode(res));
          Get.log("==========>${Get.locale!.toLanguageTag()}");
          Get.off(() => const OnBoarding1View());
        }
      } catch (e) {
        Get.log("=========>splash error: $e");
      }
    });
  }
}
