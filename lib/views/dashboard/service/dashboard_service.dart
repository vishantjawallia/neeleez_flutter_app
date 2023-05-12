import 'dart:convert';

import 'dart:ui';

import 'package:neeleez_flutter_app/api/apiRepository.dart';
import 'package:neeleez_flutter_app/models/company/company_dashboard.dart';

import '../../../config/config.dart';
import '../../../config/pref_constant.dart';
import '../../../config/preference.dart';
import '../../../models/company/company_all_data.dart';
import '../../../models/company/company_profile.dart';

mixin DashboardService {
  Future<Map?> getLanguage() async {
    String? language = SharedPreferenceHelper.getString(Preferences.languageSelected);
    if (language != 'N/A') {
      Map obj = await jsonDecode(language!);
      obj['local'] = Locale("${obj['language_code']}", "${obj['country_code']}");
      return obj;
    }
    return null;
  }

  // Future<UserData?> getUserData() async {
  //   String? id = SharedPreferenceHelper.getString(Preferences.companyId);
  //   final res = await apiRepository.apiGet('/api/Companies/$id');
  //   if (res != null) {
  //     UserData? data = UserData.fromJson(res);
  //     // log(data.customerImage!.imageFileName!);
  //     return data;
  //   } else {
  //     return null;
  //   }
  // }

  // Future<void> postCompanyLogo() async {
  //   final res = await apiRepository.apiPost('/api/Companies/CompanyLogo/', {});
  //   if (res != null) {
  //     log(res);
  //     return;
  //   } else {
  //     return;
  //   }
  // }

  Future<CompanyDashBoard?> getCompanyDashBoard() async {
    String? id = SharedPreferenceHelper.getString(Preferences.companyId);
    final res = await apiRepository.apiGet("$baseUrl/api/CompanyDashBoard/$id");
    if (res != null) {
      CompanyDashBoard? data = CompanyDashBoard.fromJson(res);
      // log(data.customerImage!.imageFileName!);
      return data;
    } else {
      return null;
    }
  }

  Future<CompanyProfile?> getCompanyProfile() async {
    String? id = SharedPreferenceHelper.getString(Preferences.companyId);
    final res = await apiRepository.apiGet("$baseUrl/api/Companies/CompanyProfile/$id");
    if (res != null) {
      CompanyProfile? data = CompanyProfile.fromJson(res);
      return data;
    } else {
      return null;
    }
  }

  Future<CompanyAllData?> getCompanyAllData() async {
    String? id = SharedPreferenceHelper.getString(Preferences.companyId);
    final res = await apiRepository.apiGet("$baseUrl/api/Companies/$id");
    if (res != null) {
      CompanyAllData? data = CompanyAllData.fromJson(res);
      // log(data.customerImage!.imageFileName!);
      return data;
    } else {
      return null;
    }
  }
}
