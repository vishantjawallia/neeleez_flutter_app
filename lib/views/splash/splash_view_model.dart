// ignore_for_file: unused_local_variable, non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neeleez_flutter_app/config/pref_constant.dart';
import 'package:neeleez_flutter_app/config/preference.dart';
import 'package:neeleez_flutter_app/provider/MainProvider.dart';
import 'package:neeleez_flutter_app/views/splash/service/splash_service.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

import '../../models/country_detail.dart';
import '../../models/ips_model/ip_api.dart';
import '../../models/ips_model/ip_base.dart';
import '../../models/ips_model/ip_info.dart';
import '../../models/ips_model/ip_list.dart';
import '../../models/ips_model/ip_whois.dart';
import '../dashboard/dashboard_view.dart';
import '../login/login_view.dart';
import '../on_boarding_1/on_boarding_1_view.dart';

class SplashViewModel extends BaseViewModel with SplashService {
  SplashViewModel();
  // loadItems();

  /* loaders-items */
  void loadItems(context) async {
    IpInfo? ipInfo = await getIpInfo();
    if (ipInfo?.country != null) {
      SharedPreferenceHelper.setString(Preferences.countryCode, ipInfo!.country!);
    } else {
      IpApiModel? IpApi = await getIpApi();
      if (IpApi?.countryCode != null) {
        SharedPreferenceHelper.setString(Preferences.countryCode, IpApi!.countryCode!);
      } else {
        IpBase? Ipbase = await getIpBase();
        if (Ipbase?.countryCode != null) {
          SharedPreferenceHelper.setString(Preferences.countryCode, Ipbase!.countryCode!);
        } else {
          IpWhois? IpWho = await getIpWhois();
          if (IpWho?.countryCode != null) {
            SharedPreferenceHelper.setString(Preferences.countryCode, IpWho!.countryCode!);
          } else {
            IpListModel? IpList = await getIpList();
            if (IpList?.countrycode != null) {
              SharedPreferenceHelper.setString(Preferences.countryCode, IpList!.countrycode!);
            }
          }
        }
      }
    }

    String? code = SharedPreferenceHelper.getString(Preferences.countryCode);
    if (code != "N/A") {
      CountryDetail? cd = await getCountryDetail(code!);
      Provider.of<MainProvider>(context,listen: false).setCountryDetail(cd);
      if (cd != null) {
        await SharedPreferenceHelper.setString(Preferences.countryDetail, jsonEncode(cd));
        bool isOnboardingCompleted = SharedPreferenceHelper.getBoolean(Preferences.isOnboardingCompleted);
        bool isLogged = SharedPreferenceHelper.getBoolean(Preferences.isLogged);
        String? languageSelected = SharedPreferenceHelper.getString(Preferences.languageSelected);
        if (languageSelected != "N/A") {
          Map dd = await jsonDecode(languageSelected!);
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
      }
    }

    // final res = await apiRepository.apiGet(Url.countryInfo);
    // log(res.toString());
    // try {
    //   if (res != null) {
    // CountryInfo info = CountryInfo.fromJson(res);
    // await SharedPreferenceHelper.setString(Preferences.countryInfo, jsonEncode(res));
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
    // if (isLogged && customerId != "N/A") {
    //   Get.off(() => const DashboardView(), transition: Transition.native);
    // } else if (isOnboardingCompleted) {
    //   Get.off(() => const LoginView());
    // } else {
    //   Get.off(() => const OnBoarding1View());
    // }
    // log("==========>${Get.locale!.toLanguageTag()}");
    // log("isOnboardingCompleted==========>$isOnboardingCompleted");
    //   }
    // } catch (e) {
    //   log("=========>splash error: $e");
    // }
  }
}
