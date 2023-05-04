import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neeleez_flutter_app/components/dailogs/logout_popup.dart';
import 'package:neeleez_flutter_app/config/pref_constant.dart';
import 'package:neeleez_flutter_app/config/preference.dart';
import 'package:neeleez_flutter_app/models/user_data.dart';
import 'package:neeleez_flutter_app/views/company_profile/company_profile_view.dart';
import 'package:neeleez_flutter_app/views/company_profile/services/company_profile_service.dart';
import 'package:neeleez_flutter_app/views/dashboard/service/dashboard_service.dart';
import 'package:neeleez_flutter_app/views/notifications/notifications_view.dart';
import 'package:stacked/stacked.dart';

import '../../components/dailogs/language_popup.dart';
import '../../models/amenities/amenities.dart';
import '../../models/business_types/business_services_by_country.dart';
import '../../models/company/company_all_data.dart';
import '../../models/company/company_dashboard.dart';
import '../../models/gender/gender.dart';

class DashboardViewModel extends BaseViewModel with DashboardService, CompanyProfileService {
  //get
  // UserData? get user => userData;
  CompanyAllData? companyAllData;
  CompanyDashBoard? company;
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
    // userData = await getUserData();
    company = await getCompanyDashBoard();
    companyAllData = await getCompanyAllData();
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

  void onDrawerItemTap(context, Map obj) async {
    if (obj['id'] == 15) {
      logoutPopup(context);
    } else {
      if (obj['route'].runtimeType != String) {
        Widget hh = obj['route'] as Widget;
        if (hh is CompanyProfileView) {
          setBusy(true);
          List<Gender> genders = await getGenders() ?? [];
          List<Amenities> amentias = await getAmenities() ?? [];
          List<BusinessServicesByCountry>? businessCategory = await getBusinessCategory('143') ?? [];
          setBusy(false);
          notifyListeners();
          Get.to(() => CompanyProfileView(
                user: userData,
                amentiasList: amentias,
                businessCategoryList: businessCategory,
                serviceForList: genders,
              ));
        }
        // Get.to(() => hh);
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
