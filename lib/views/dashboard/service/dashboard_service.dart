import 'dart:convert';
import 'dart:developer';
import 'dart:ui';

import 'package:neeleez_flutter_app/api/apiRepository.dart';
import 'package:neeleez_flutter_app/models/company/company_dashboard.dart';

import '../../../config/pref_constant.dart';
import '../../../config/preference.dart';
import '../../../config/url.dart';
import '../../../models/user_data.dart';

mixin DashboardService {
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
    final res = await apiRepository.apiGet('${Url.customerById}/$id');
    if (res != null) {
      UserData? data = UserData.fromJson(res);
      log(data.customerImage!.imageFileName!);
      return data;
    } else {
      return null;
    }
  }

  Future<CompanyDashBoard?> companyDashBoard(String companyId) async {
    final res = await apiRepository.apiGet("/api/CompanyDashBoard/$companyId");
    if (res != null) {
      CompanyDashBoard? data = CompanyDashBoard.fromJson(res);
      // log(data.customerImage!.imageFileName!);
      return data;
    } else {
      return null;
    }
  }


}
