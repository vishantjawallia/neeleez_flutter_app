import 'dart:developer';

import 'package:neeleez_flutter_app/api/apiRepository.dart';
import 'package:neeleez_flutter_app/components/dailogs/logout_popup.dart';
import 'package:neeleez_flutter_app/config/pref_constant.dart';
import 'package:neeleez_flutter_app/config/preference.dart';
import 'package:neeleez_flutter_app/config/url.dart';
import 'package:neeleez_flutter_app/models/user_data.dart';
import 'package:stacked/stacked.dart';

class DashboardViewModel extends BaseViewModel {
  UserData get user => userData ?? const UserData();
  UserData? userData;
  DashboardViewModel({this.userData}) {
    loadItems();
  }

  // Add ViewModel specific code here
  Future<void> loadItems() async {
    setBusy(true);
    userData ??= await getUserData();
    //Write your models loading codes here

    //Let other views to render again
    setBusy(false);
    notifyListeners();
  }

  void setUserData(UserData? user) {
    userData = user;
    notifyListeners();
  }

  void onDrawerItemTap(context, Map obj) {
    if (obj['id'] == 15) {
      // Get.to(() => const LogoutPopup());
      logoutPopup(context);
      // SharedPreferenceHelper.setString(Preferences.customerId, 'N/A');
      // SharedPreferenceHelper.setString(Preferences.countryInfo, 'N/A');
      // SharedPreferenceHelper.setBoolean(Preferences.isLogged, false);
      // Get.offAll(() => const LoginView());
    } else {
      if ('${obj['route']}'.isNotEmpty) {
        // Get.to(() => '${obj['route']}');
      }
    }
  }
}

Future<UserData?> getUserData() async {
  try {
    String? id = SharedPreferenceHelper.getString(Preferences.userId);
    final res = await apiRepository.apiGet(url: '${Url.customerById}/$id');
    if (res != null) {
      var data = UserData.fromJson(res);
      log(data.toString());
      return data;
    }
  } catch (e) {
    log("Error===========>$e");
  } finally {
    log("===========>finally");
  }
  return null;
}
